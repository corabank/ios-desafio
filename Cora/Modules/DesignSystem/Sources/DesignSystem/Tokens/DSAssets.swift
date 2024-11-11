import UIKit

public enum DSAssets: String {
    case coraCoverLogin,
         coraLogoLogin

    public var image: UIImage {
        UIImage(named: rawValue, in: Bundle.module, compatibleWith: nil) ?? .init()
    }
}
