import Foundation
import CoraClientInterfaces
import Testing

@testable import CoraClient

@Suite("Api Client")
final class ApiClientTest {
    enum TestCase: String, CaseIterable {
        case success = "Fetch Success",
             invalidURL = "Invalid URL",
             invalidData = "Unexpected Data"
        
        static var titles: [String] {
            ["Fetch Success",
             "Invalid URL",
             "Unexpected Data"]
        }
    }
    
    private lazy var apiClient = ApiClient(urlSession: mockSession)
    private let mockSession = MockURLSession()
    
    @Test("Fetch Data", arguments: TestCase.titles)
    func fetchData(testCase: String) async throws {
        
        let testCase = try #require(TestCase(rawValue: testCase))
        
        switch testCase {
        case .success:
            mockSession.data = MockResponse.mockData
            
            let request = MockRequest(path: "https://valid.url")
            let result: TestObject = try await apiClient.fetch(request: request)
            
            // Assert
            #expect(result.id == 1)
            #expect(result.name == "Test Item")
        case .invalidURL:
            let request = MockRequest(path: "123:123")            
            do {
                let _: TestObject = try await apiClient.fetch(request: request)
                Issue.record()
            } catch {
                let error = try #require(error as? ApiError)
                #expect(error == .notFound)
            }
        case .invalidData:
            mockSession.data = MockResponse.invalidMockData
            
            let request = MockRequest(path: "https://valid.url")
            do {
                let _: TestObject = try await apiClient.fetch(request: request)
                Issue.record()
            } catch {
                let error = try #require(error as? ApiError)
                #expect(error == .invalidData)
            }
        }
    }
}

// Mocks
private struct TestObject: Decodable {
    let id: Int
    let name: String
}

private struct MockRequest: RequestProtocol {
    var body: (any Encodable)?
    var headers: [String: String] = [:]
    var method: RequestMethod { .get }
    var encoding: RequestEncoding { .query }
    var path: String
}

private struct MockResponse {
    static let mockData = """
    {
        "id": 1,
        "name": "Test Item"
    }
    """.data(using: .utf8)
    
    static let invalidMockData = """
    {
        "amount": 2
    }
    """.data(using: .utf8)
}

private final class MockURLSession: URLSessionProtocol {
    var data: Data?
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        guard let data = data else {
            throw URLError(.badServerResponse)
        }
        return (data, URLResponse())
    }
}
