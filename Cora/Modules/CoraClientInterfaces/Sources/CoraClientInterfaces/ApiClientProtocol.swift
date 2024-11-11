import Foundation

public enum ApiError: Error {
    case notFound,
         business,
         invalidData
}

public protocol ApiClientProtocol {
    func fetch<T: Decodable>(request: RequestProtocol) async throws -> T
}
