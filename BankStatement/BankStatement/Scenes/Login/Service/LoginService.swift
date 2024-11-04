import CoraClient
import CoraClientInterfaces
import Foundation

protocol LoginServiceProtocol {
    func saveData()
    func getData()
    
    func login()
}

enum LoginServiceFactory {
    static func build() -> LoginServiceProtocol {
        LoginService()
    }
}

private final class LoginService: LoginServiceProtocol {
    
    var localRepository: LocalDataSourceProtocol
    var apiClient: ApiClientProtocol
    
    init(localRepository: LocalDataSourceProtocol = LocalDataSource()) {
        self.localRepository = localRepository
        self.apiClient = ApiClientFactory.build()
    }
    
    func saveData() {
        
    }
    
    func getData() {
        
    }
    
    
    func login() {
//        let request =
    }
    
}
