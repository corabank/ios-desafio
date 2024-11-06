import UIKit

public enum ButtonSize: ButtonSizeProtocol {
    case small,
         medium,
         large

    public var height: CGFloat {
        switch self {
        case .small: return 48
        case .medium: return 64
        case .large: return 72
        }
    }

    public var cornerRadius: CGFloat {
        switch self {
        case .small: return 12.0
        case .medium: return 16.0
        case .large: return 23.5
        }
    }

    public var iconPadding: CGFloat { 16.0 }
    public var textPadding: CGFloat { 16.0 }
}

public enum ButtonStyle: ButtonStyleProtocol {
    case primary,
         secondary,
         disabled

    public var backgroundColor: UIColor {
        switch self {
        case .primary: return UIColor(named: Colors.primary.rawValue) ?? .systemPink
        case .secondary: return UIColor(named: Colors.white.rawValue) ?? .white
        case .disabled: return UIColor(named: Colors.grayTwo.rawValue) ?? .systemGray2
        }
    }

    public var titleColor: UIColor {
        switch self {
        case .primary, .disabled: return UIColor(named: Colors.white.rawValue) ?? .white
        case .secondary: return UIColor(named: Colors.primary.rawValue) ?? .systemPink
        }
    }

    public var borderColor: UIColor? {
        switch self {
        case .secondary: return UIColor(named: Colors.primary.rawValue)
        default: return nil
        }
    }
}
