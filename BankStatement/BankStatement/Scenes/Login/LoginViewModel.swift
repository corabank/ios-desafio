import Foundation

protocol LoginViewModelProtocol {
    func documentDidChange(text: String)
    func passwordDidChange(text: String)
    func routeToPassword()
    func login()
}

final class LoginViewModel: LoginViewModelProtocol {
    enum LocalDataSourceKeys: String {
        case document, password
    }
    
    private let coordinator: MainCoordinatorProtocol,
                localRepository: LocalDataSource,
                service: LoginServiceProtocol
    
    private var document: String = "",
                password: String = ""
    
    init(coordinator: MainCoordinatorProtocol, localRepository: LocalDataSource = LocalDataSource()) {
        self.coordinator = coordinator
        self.localRepository = localRepository
        self.service = LoginServiceFactory.build()
    }
    
    func documentDidChange(text: String) {
        document = text
    }
    
    func passwordDidChange(text: String) {
        password = text
    }
    
    func routeToPassword() {
        saveDocument()
        coordinator.handle(event: .password)
    }
    
    func login() {
        //passar o getdata pro service
        guard let document = localRepository.getData(key: LocalDataSourceKeys.document.rawValue) as? String else { return }
        
        guard !document.isEmpty, !password.isEmpty else {
            
            return
        }
        
        print("\(document)")
        print("\(password)")
        //chmar o service . fetch data
    }
    
    private func saveDocument() {
        localRepository.saveData(data: document, for: LocalDataSourceKeys.document.rawValue)
    }
}
