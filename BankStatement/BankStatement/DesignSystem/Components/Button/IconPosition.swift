import UIKit

enum IconPosition: IconPositionProtocol {
    case left,
         right,
         none

    func configureIcon(in button: UIButton, icon: UIImage?) {
        guard let icon = icon else { return }

        let iconImageView = UIImageView(image: icon)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(iconImageView)

        let iconSize: CGFloat = 24

        switch self {
        case .left:
            NSLayoutConstraint.activate([
                iconImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 16),
                iconImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: iconSize),
                iconImageView.heightAnchor.constraint(equalToConstant: iconSize),
                button.titleLabel!.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8)
            ])

        case .right:
            NSLayoutConstraint.activate([
                iconImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -16),
                iconImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: iconSize),
                iconImageView.heightAnchor.constraint(equalToConstant: iconSize),
                button.titleLabel!.trailingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: -8)
            ])

        case .none:
            break
        }
    }
}
