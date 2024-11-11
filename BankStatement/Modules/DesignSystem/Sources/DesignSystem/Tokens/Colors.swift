import UIKit

public enum Colors: String {
    case black = "black",
         grayOne = "grayOne",
         grayTwo = "grayTwo",
         grayFour = "grayFour",
         offBlack = "offBlack",
         primary = "primary",
         secondaryLight = "secondaryLight",
         white = "white"

    public var uiColor: UIColor {
        UIColor(named: rawValue, in: Bundle.module, compatibleWith: nil) ?? .init()
    }
}
