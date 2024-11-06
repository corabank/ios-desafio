import Foundation

protocol LoginPasswordViewModelProtocol {
    var isActionEnabled: ((Bool) -> Void)? { get set }
    var showAuthError: (() -> Void)? { get set }
    
    func passwordDidChange(text: String)
    func next()
}

final class LoginPasswordViewModel: LoginPasswordViewModelProtocol {
    var showAuthError: (() -> Void)?
    var isActionEnabled: ((Bool) -> Void)?
    
    private let coordinator: MainCoordinatorProtocol,
                service: LoginServiceProtocol
    
    private var password: String = ""
    
    init(coordinator: MainCoordinatorProtocol,
         service: LoginServiceProtocol = LoginServiceFactory.build()) {
        self.coordinator = coordinator
        self.service = service
    }
    
    func passwordDidChange(text: String) {
        password = text
        
        if password.isEmpty {
            isActionEnabled?(false)
        } else {
            isActionEnabled?(true)
        }
    }
    
    func next()  {
        if !password.isEmpty {
            savePassword()
            
            Task {
                await auth()
            }
        }
    }
    
    private func routeToStatements() {
        coordinator.handle(event: .statement)
    }
    
    private func savePassword() {
        service.saveData(data: password, key: LocalDataSourceKeys.password.rawValue)
    }
    
    @MainActor
    private func auth() async {
        if let _ = await service.login() {
            routeToStatements()
        } else {
            showAuthError?()
        }
    }
}
