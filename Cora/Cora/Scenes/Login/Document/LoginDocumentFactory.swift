import Foundation

enum LoginDocumentFactory {
    static func build(mainCoordinator: MainCoordinatorProtocol) -> LoginDocumentViewController {
        return LoginDocumentViewController(viewModel: LoginDocumentViewModel.init(coordinator: mainCoordinator))
    }
}
