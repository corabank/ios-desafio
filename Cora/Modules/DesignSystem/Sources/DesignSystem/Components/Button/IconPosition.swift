import UIKit

public enum IconPosition: IconPositionProtocol {
    case left,
         right,
         none

    public func configureIcon(in button: UIButton, icon: UIImage?) {
        guard let icon = icon, let titleLabel = button.titleLabel else { return }

        let iconImageView = UIImageView(image: icon)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(iconImageView)

        let iconSize: CGFloat = 24

        switch self {
        case .left:
            NSLayoutConstraint.activate([
                iconImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 24),
                iconImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: iconSize),
                iconImageView.heightAnchor.constraint(equalToConstant: iconSize),
                titleLabel.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -12)
            ])

        case .right:
            NSLayoutConstraint.activate([
                iconImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -12),
                iconImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: iconSize),
                iconImageView.heightAnchor.constraint(equalToConstant: iconSize),
                titleLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 24)
            ])

        case .none:
            break
        }
    }
}
