import Foundation

enum LoginPasswordFactory {
    static func build() -> LoginPasswordViewController {
        return LoginPasswordViewController(viewModel: LoginViewModel.init())
    }
}
