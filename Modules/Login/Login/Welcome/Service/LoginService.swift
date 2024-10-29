import Foundation

final class AuthService {
    
    func auth(to user: String,
              pass: String,
              completion: @escaping (Bool) -> Void) {
        //NetworkingServiceFactory.
        
    }
    
    func logout() {
        //NetworkingServiceFactory.logout()
    }
}

private struct AuthData {
    var document: String?
    var password: String?
}
