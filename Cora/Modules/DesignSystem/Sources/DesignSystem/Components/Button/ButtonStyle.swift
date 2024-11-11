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
        case .primary: return Colors.primary.uiColor
        case .secondary: return Colors.white.uiColor
        case .disabled: return Colors.grayTwo.uiColor
        }
    }

    public var titleColor: UIColor {
        switch self {
        case .primary, .disabled: return Colors.white.uiColor
        case .secondary: return Colors.primary.uiColor
        }
    }

    public var borderColor: UIColor? {
        switch self {
        case .secondary: return Colors.primary.uiColor
        default: return nil
        }
    }
}
