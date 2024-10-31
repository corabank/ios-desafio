import Foundation

enum LoginDocumentFactory {
    static func build() -> LoginDocumentViewController {
        return LoginDocumentViewController(viewModel: LoginViewModel.init())
    }
}
