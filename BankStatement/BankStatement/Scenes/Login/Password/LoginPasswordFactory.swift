import Foundation

enum LoginPasswordFactory {
    static func build(mainCoordinator: MainCoordinatorProtocol) -> LoginPasswordViewController {
        return LoginPasswordViewController(viewModel: LoginViewModel.init(coordinator: mainCoordinator))
    }
}
