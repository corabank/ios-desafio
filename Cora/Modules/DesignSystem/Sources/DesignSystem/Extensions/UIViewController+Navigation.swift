import UIKit

public extension UIViewController {
    @objc func didTapBackButton() {
        if navigationController?.viewControllers.count == 2 {
            navigationController?.setNavigationBarHidden(true, animated: false)
        }
        navigationController?.popViewController(animated: true)
    }
}
