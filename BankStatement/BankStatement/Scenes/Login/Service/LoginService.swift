import CoraClient
import CoraClientInterfaces
import Foundation

protocol LoginServiceProtocol {
    func saveData(data: String, key: String)
    func getData(key: String) -> String
    
    func login()
}

enum LoginServiceFactory {
    static func build() -> LoginServiceProtocol {
        LoginService()
    }
}

enum LocalDataSourceKeys: String {
    case document, password
}

private final class LoginService: LoginServiceProtocol {
    var localRepository: LocalDataSourceProtocol
    var apiClient: ApiClientProtocol
    
    init(localRepository: LocalDataSourceProtocol = LocalDataSource()) {
        self.localRepository = localRepository
        self.apiClient = ApiClientFactory.build()
    }
    
    func saveData(data: String, key: String) {
        localRepository.saveData(data: data, for: key)
    }
    
    func getData(key: String) -> String {
        localRepository.getData(key: key) as? String ?? ""
    }
    
    func login() {
        let document = getData(key: LocalDataSourceKeys.document.rawValue)
        let password = getData(key: LocalDataSourceKeys.password.rawValue)
        
        print(document)
        print(password)
        
        //apiClient.fetch(request: LoginRequest())
    }
    
}

//move to coraclientinterfaces
struct LoginRequest: RequestProtocol {
    var path: String { "https://api.challenge.stage.cora.com.br/challenge/auth" }
    var body: Encodable?
    var headers: [String : String]
    var method: RequestMethod { .post }
    var encoding: RequestEncoding { .json }
}

struct AuthResponse: Encodable {
    let token: String
}
