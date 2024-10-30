import UIKit

enum ButtonSize: ButtonSizeProtocol {
    case small,
         medium,
         large

    var height: CGFloat {
        switch self {
        case .small: return 48
        case .medium: return 64
        case .large: return 72
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .small: return 12.0
        case .medium: return 16.0
        case .large: return 23.5
        }
    }

    var iconPadding: CGFloat { 16.0 }
    var textPadding: CGFloat { 16.0 }
}

enum ButtonStyle: ButtonStyleProtocol {
    case primary, secondary

    var backgroundColor: UIColor {
        switch self {
        case .primary: return UIColor(named: Colors.primary.rawValue) ?? .systemPink
        case .secondary: return UIColor(named: Colors.white.rawValue) ?? .white
        }
    }

    var titleColor: UIColor {
        switch self {
        case .primary: return UIColor(named: Colors.white.rawValue) ?? .white
        case .secondary: return UIColor(named: Colors.primary.rawValue) ?? .systemPink
        }
    }

    var borderColor: UIColor? {
        switch self {
        case .secondary: return UIColor(named: Colors.primary.rawValue)
        default: return nil
        }
    }
}
