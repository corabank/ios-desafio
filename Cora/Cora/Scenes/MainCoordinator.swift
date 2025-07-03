import UIKit

enum MainEvent {
    case intro
    case document
    case password
    case statement
    case detail
}

protocol MainCoordinatorProtocol: AnyObject {
    func handle(event: MainEvent)
}

final class MainCoordinator: MainCoordinatorProtocol {
    private var window: UIWindow?
    private var navigation: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
        
        navigation = UINavigationController(rootViewController: /*IntroViewController(coordinator: self)*/StatementViewController())
    }
    
    func handle(event: MainEvent) {
        switch event {
        case .intro:
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()
        case .document:
            let documentController = LoginDocumentFactory.build(mainCoordinator: self)
            navigation?.pushViewController(documentController, animated: true)
        case .password:
            let passwordController = LoginPasswordFactory.build(mainCoordinator: self)
            navigation?.pushViewController(passwordController, animated: true)
        case .statement:
            let statementController = StatementViewController()
            navigation?.pushViewController(statementController, animated: true)
        case .detail:
            break
        }
    }
}
