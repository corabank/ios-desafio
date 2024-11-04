import Foundation

protocol LoginDocumentViewModelProtocol {
    func documentDidChange(text: String)
    func next()
}

final class LoginDocumentViewModel: LoginDocumentViewModelProtocol {
    
    private let coordinator: MainCoordinatorProtocol,
                service: LoginServiceProtocol
    
    private var document: String = ""
    
    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
        self.service = LoginServiceFactory.build()
    }
    
    func next() {
        if !document.isEmpty {
            saveDocument()
            routeToPassword()
        }
    }
    
    func documentDidChange(text: String) {
        document = text
    }
    
    private func routeToPassword() {
        coordinator.handle(event: .password)
    }
    
    private func saveDocument() {
        service.saveData(data: document, key: LocalDataSourceKeys.document.rawValue)
        
    }
}
