import UIKit

public protocol ButtonSizeProtocol {
    var height: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var iconPadding: CGFloat { get }
    var textPadding: CGFloat { get }
}

public protocol ButtonStyleProtocol {
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
    var borderColor: UIColor? { get }
}

public protocol IconPositionProtocol {
    func configureIcon(in button: UIButton, icon: UIImage?)
}
