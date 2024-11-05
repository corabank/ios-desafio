import Foundation

protocol LoginPasswordViewModelProtocol {
    func passwordDidChange(text: String)
    func next() async throws
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
    
    func next() async throws  {
        if !password.isEmpty {
            savePassword()
            try await auth()
        }
    }
    
    func routeToStatements() {
        coordinator.handle(event: .statement)
    }
    
    private func savePassword() {
        service.saveData(data: password, key: LocalDataSourceKeys.password.rawValue)
    }
    
    private func auth() async throws {
        try await service.login()
    }
}
