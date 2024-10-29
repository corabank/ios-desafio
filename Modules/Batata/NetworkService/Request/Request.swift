import Foundation

public protocol Request {
    var method: HTTPMethod { get }
    var endpoint: String { get }
    var parameters: [URLQueryItem] { get }
}

public enum HTTPMethod: String {
    case get = "GET",
         post = "POST"
}
