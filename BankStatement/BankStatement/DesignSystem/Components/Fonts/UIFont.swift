import UIKit

enum Fonts: String {
    case avenirHeavy = "Avenir-Heavy",
         avenirRoman = "Avenir-Roman"
}

enum FontWeight {
    case bold,
         regular
}

enum FontSize: CGFloat {
    case titleOne = 36,
         titleTwo = 28,
         titleThree = 22,
         bodyOne = 16,
         bodyTwo = 14,
         caption = 12
}

extension UIFont {
    static func designFont(size: FontSize, weight: FontWeight) -> UIFont {
        let fontName: String

        switch weight {
        case .bold:
            fontName = Fonts.avenirHeavy.rawValue
        case .regular:
            fontName = Fonts.avenirRoman.rawValue
        }

        return UIFont(name: fontName, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue)
    }
}
