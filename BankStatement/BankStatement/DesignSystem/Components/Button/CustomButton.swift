import UIKit

final class CustomButton: UIButton {
    private let size: ButtonSizeProtocol
    private let style: ButtonStyleProtocol
    private let iconPosition: IconPositionProtocol

    init(size: ButtonSizeProtocol,
         style: ButtonStyleProtocol,
         iconPosition: IconPositionProtocol,
         title: String,
         icon: UIImage? = nil) {
        self.size = size
        self.style = style
        self.iconPosition = iconPosition
        super.init(frame: .zero)
        setupButton(title: title, icon: icon)
    }

    required init?(coder: NSCoder) { nil }

    private func setupButton(title: String, icon: UIImage?) {
        setTitle(title, for: .normal)
        setTitleColor(style.titleColor, for: .normal)
        backgroundColor = style.backgroundColor
        layer.cornerRadius = size.cornerRadius
        layer.borderColor = style.borderColor?.cgColor
        layer.borderWidth = style.borderColor == nil ? 0 : 1
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        iconPosition.configureIcon(in: self, icon: icon)
        tintColor = style.titleColor

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: size.height)
        ])
    }
}
