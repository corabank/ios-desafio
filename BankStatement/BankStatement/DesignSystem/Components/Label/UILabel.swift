import UIKit

extension UILabel {

    func applyStyle(size: FontSize,
                    weight: FontWeight,
                    textColor: UIColor,
                    alignment: NSTextAlignment = .left,
                    numberOfLines: Int = 0) {
        self.font = UIFont.designFont(size: size, weight: weight)

        self.textColor = textColor
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
    }
}
