import UIKit

protocol ButtonSizeProtocol {
    var height: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var iconPadding: CGFloat { get }
    var textPadding: CGFloat { get }
}

protocol ButtonStyleProtocol {
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
    var borderColor: UIColor? { get }
}

protocol IconPositionProtocol {
    func configureIcon(in button: UIButton, icon: UIImage?)
}
