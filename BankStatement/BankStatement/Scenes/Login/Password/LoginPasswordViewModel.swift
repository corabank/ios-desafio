import Foundation

protocol LoginPasswordViewModelProtocol {
    func passwordDidChange(text: String)
    func next()
    func routeToStatements()
}

final class LoginPasswordViewModel: LoginPasswordViewModelProtocol {
    
    private let coordinator: MainCoordinatorProtocol,
                service: LoginServiceProtocol
    
    private var password: String = ""
    
    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
        self.service = LoginServiceFactory.build()
    }
    
    func passwordDidChange(text: String) {
        password = text
    }
    
    func next()  {
        if !password.isEmpty {
            savePassword()
            
            Task {
                await auth()
            }
        }
    }
    
    func routeToStatements() {
        coordinator.handle(event: .statement)
    }
    
    private func savePassword() {
        service.saveData(data: password, key: LocalDataSourceKeys.password.rawValue)
    }
    
    @MainActor
    private func auth() async {
        if let _ = await service.login() {
            routeToStatements()
        }
    }
}
