import Foundation

enum LoginPasswordFactory {
    static func build(mainCoordinator: MainCoordinatorProtocol) -> LoginPasswordViewController {
        return LoginPasswordViewController(viewModel: LoginPasswordViewModel.init(coordinator: mainCoordinator))
    }
}
