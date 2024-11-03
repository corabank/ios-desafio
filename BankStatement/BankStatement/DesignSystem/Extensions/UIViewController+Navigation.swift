import UIKit

extension UIViewController {
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
