import XCTest

import Foundation

import NetworkInterfaces
import NetworkDetail
import Handler

final class URLSessionTests: XCTestCase {
    
    func test_post_with_correct_url() async {
        let endpoint = EndpointDTOFactory.make()
        var request: URLRequest!
        
        let sut = makeSUT()

        InterceptorRequestStub.simulate(data: nil, response: makeResponse(statusCode: 200), error: nil )
        InterceptorRequestStub.observeRequest { request = $0 }
        
        do {
            _ = try await sut.post(endpoint: endpoint, bodyDataJSON: makeValidData())
        } catch let error {
            XCTFail(error.localizedDescription)
            return
        }
        
        XCTAssertEqual(endpoint.url, request.url)
        XCTAssertEqual("POST", request.httpMethod)
        XCTAssertNotNil(request.httpBodyStream)
        XCTAssertEqual("application/json", request.allHTTPHeaderFields?["Content-Type"])
    }
    
    func test_post_with_no_data() async {
        let endpoint = EndpointDTOFactory.make()
        var request: URLRequest!
        
        let sut = makeSUT()

        InterceptorRequestStub.simulate(data: nil, response: makeResponse(statusCode: 200), error: nil )
        InterceptorRequestStub.observeRequest { request = $0 }
        
        do {
            _ = try await sut.post(endpoint: endpoint, bodyDataJSON: nil)
        } catch let error {
            XCTFail(error.localizedDescription)
            return
        }
        
        XCTAssertEqual(endpoint.url, request.url)
        XCTAssertEqual("POST", request.httpMethod)
        XCTAssertNil(request.httpBodyStream)
        XCTAssertEqual("application/json", request.allHTTPHeaderFields?["Content-Type"])
    }
    
    
    func test_post_with_error() async {
        let endpoint = EndpointDTOFactory.make()
        
        let sut = makeSUT()

        InterceptorRequestStub.simulate(data: nil, response: nil, error: makeError() )
        
        do {
            let responseDTO = try await sut.post(endpoint: endpoint, bodyDataJSON: makeValidData())
            XCTFail("Unexpetec success: \(responseDTO)")
        } catch let error {
            XCTAssertNotNil(error)
            return
        }
        
    }
    
    func test_post_with_data_empty() async {
        let endpoint = EndpointDTOFactory.make()
        
        let sut = makeSUT()

        InterceptorRequestStub.simulate(data: Data(), response: makeResponse(statusCode: 200), error: nil )
        
        do {
            let responseDTO = try await sut.post(endpoint: endpoint, bodyDataJSON: Data() )
            XCTAssertEqual(responseDTO.statusCode, 200)
            
        } catch let error {
            XCTFail("Unexpetec error: \(error.localizedDescription)")
            return
        }
        
    }
    
    
    
}


//  MARK: - MAKE SUT
extension URLSessionTests {
    func makeSUT() -> URLSessionProvider {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [InterceptorRequestStub.self]
        let session = URLSession(configuration: configuration)
        let sut = URLSessionProvider(session: session)
        return sut
    }
    
    func makeURL() -> URL {
        return URL(string: "http://any-url.com")!
    }
    
    func makeValidData() -> Data {
        return Data("""
    {
        "name": "Alessandro",
    }
    """.utf8)
    }
    
    func makeResponse(statusCode: Int = 200) -> HTTPURLResponse {
        return HTTPURLResponse(url: makeURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }

    func makeError() -> Error {
        return NSError(domain: "any_error", code: 0)
    }
}

public class EndpointDTOFactory {
    public static func make(url: URL = URL(string: "http://any-url.com")!,
                     headers: [String : String]? = nil,
                     queryParameters: [String : String]? = nil) -> EndpointDTO {
        return EndpointDTO (
            url: url,
            headers: headers,
            queryParameters: queryParameters)
    }
}
