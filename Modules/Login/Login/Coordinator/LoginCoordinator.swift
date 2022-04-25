import UIKit

public final class LoginCoordinator: LoginCoordinatorProtocol {
    
    private lazy var navigation: UINavigationController? = nil
    
    public init() {}
    
    public func set(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    public func start(animated: Bool) {
        // todo
    }
    
    func login() {
        // todo
    }
}