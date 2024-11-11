import UIKit

public enum Icons: String {
    case icArrowDown = "ic_arrow-down",
         icArrowReturn = "ic_arrow-return",
         icArrowRight = "ic_arrow-right",
         icArrowUpOut = "ic_arrow-up-out",
         icBarCode = "ic_bar-code",
         icChevronLeft = "ic_chevron-left",
         icExportInvoice = "ic_export-invoice",
         icEyeHidden = "ic_eye-hidden",
         icEyeVisible = "ic_eye-visible",
         icFilter = "ic_filter",
         icPercentage = "ic_percentage",
         icShareIos = "ic_share-ios"

    public var image: UIImage {
        UIImage(named: rawValue, in: Bundle.module, compatibleWith: nil) ?? .init()
    }
}
