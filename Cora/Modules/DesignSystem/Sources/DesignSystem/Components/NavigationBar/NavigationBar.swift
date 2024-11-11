import UIKit

public struct NavigationBar {
    public static func apply(to viewController: UIViewController,
                             title: String,
                             rightButtonImage: UIImage?,
                             rightButtonAction: Selector?) {
        viewController.title = title

        if let navigationController = viewController.navigationController, navigationController.viewControllers.count > 1 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: Icons.icChevronLeft.image,
                                                                              style: .plain,
                                                                              target: viewController,
                                                                              action: #selector(viewController.didTapBackButton))
        }

        if let rightButtonAction = rightButtonAction {
            let rightButton = UIBarButtonItem(image: rightButtonImage,
                                              style: .plain,
                                              target: viewController,
                                              action: rightButtonAction)
            viewController.navigationItem.rightBarButtonItem = rightButton
        }

        if let navigationController = viewController.navigationController {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Colors.grayFour.uiColor
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: Colors.offBlack.uiColor,
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: 14) ?? .systemFont(ofSize: 14)
            ]
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance

            navigationController.navigationBar.tintColor = Colors.primary.uiColor
        }
        
        viewController.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
