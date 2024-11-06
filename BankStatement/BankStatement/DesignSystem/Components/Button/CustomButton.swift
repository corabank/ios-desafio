import UIKit

enum CustomButtonBuilder {
    static func build(size: ButtonSize,
                      style: ButtonStyle,
                      iconPosition: IconPosition,
                      title: String,
                      icon: UIImage? = nil) -> CustomButton {
        CustomButton(size: size,
                     style: style,
                     iconPosition: iconPosition,
                     title: title,
                     icon: icon)
    }
}

final class CustomButton: UIButton {
    private let size: ButtonSizeProtocol
    private var style: ButtonStyleProtocol
    private let iconPosition: IconPositionProtocol
    private var title: String
    private let icon: UIImage?

    init(size: ButtonSizeProtocol,
         style: ButtonStyleProtocol,
         iconPosition: IconPositionProtocol,
         title: String,
         icon: UIImage?) {
        self.size = size
        self.style = style
        self.iconPosition = iconPosition
        self.title = title
        self.icon = icon
        super.init(frame: .zero)
        setupButton(title: title, icon: icon)
    }
    
    public func setStyle(with style: ButtonStyle) {
        self.style = style
        setupButton(title: self.title, icon: self.icon)
    }

    required init?(coder: NSCoder) { nil }

    private func setupButton(title: String, icon: UIImage?) {
        setTitle(title, for: .normal)
        setTitleColor(style.titleColor, for: .normal)
        backgroundColor = style.backgroundColor
        layer.cornerRadius = size.cornerRadius
        layer.borderColor = style.borderColor?.cgColor
        layer.borderWidth = style.borderColor == nil ? 0 : 1
        titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14)
        iconPosition.configureIcon(in: self, icon: icon)
        tintColor = style.titleColor

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size.height)
        ])
    }
}
