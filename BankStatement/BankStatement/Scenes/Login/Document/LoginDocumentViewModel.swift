import Foundation

protocol LoginDocumentViewModelProtocol {
    var isActionEnabled: ((Bool) -> Void)? { get set }
    func documentDidChange(text: String)
    func next()
}

final class LoginDocumentViewModel: LoginDocumentViewModelProtocol {
    var isActionEnabled: ((Bool) -> Void)?
    
    private let coordinator: MainCoordinatorProtocol,
                service: LoginServiceProtocol
    
    private var document: String = ""
    
    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
        self.service = LoginServiceFactory.build()
    }
    
    func next() {
        saveDocument()
        routeToPassword()
    }
    
    func documentDidChange(text: String) {
        document = text
        
        if document.isEmpty {
            isActionEnabled?(false)
        } else {
            isActionEnabled?(true)
        }
    }
    
    private func routeToPassword() {
        coordinator.handle(event: .password)
    }
    
    private func saveDocument() {
        service.saveData(data: document, key: LocalDataSourceKeys.document.rawValue)
        
    }
}
