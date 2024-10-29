import Foundation

public protocol NetworkServiceProtocol {
    func execute<T: Codable>(with request: Request, completion: @escaping (Result<T, Error>) -> Void)
}
