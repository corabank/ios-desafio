import UIKit

struct NavigationBar {
    static func apply(to viewController: UIViewController,
                      title: String,
                      rightButtonImage: UIImage?,
                      rightButtonAction: Selector?) {
        viewController.title = title

        if let navigationController = viewController.navigationController, navigationController.viewControllers.count > 1 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: Icons.icChevronLeft.rawValue),
                                                                              style: .plain,
                                                                              target: viewController,
                                                                              action: #selector(viewController.didTapBackButton))
        }

        if let rightButtonAction = rightButtonAction {
            let rightButton = UIBarButtonItem(image: rightButtonImage, style: .plain, target: viewController, action: rightButtonAction)
            viewController.navigationItem.rightBarButtonItem = rightButton
        }

        if let navigationController = viewController.navigationController {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: Colors.grayFour.rawValue)
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(named: Colors.offBlack.rawValue) ?? .gray,
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: 14) ?? .systemFont(ofSize: 14)
            ]
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance

            navigationController.navigationBar.tintColor = UIColor(named: Colors.primary.rawValue)
        }
    }
}
