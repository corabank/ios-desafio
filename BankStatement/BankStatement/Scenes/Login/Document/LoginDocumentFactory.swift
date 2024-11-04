import Foundation

enum LoginDocumentFactory {
    static func build(mainCoordinator: MainCoordinatorProtocol) -> LoginDocumentViewController {
        return LoginDocumentViewController(viewModel: LoginViewModel.init(coordinator: mainCoordinator))
    }
}
