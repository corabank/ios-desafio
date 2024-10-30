import UIKit

final class LinkButton: UIControl {
    enum ButtonColor {
        case white,
             primary
    }

    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.isUserInteractionEnabled = false
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    private let buttonColor: ButtonColor
    private var text: String?

    init(text: String,
         color: ButtonColor) {
        self.text = text
        self.buttonColor = color
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - Private Setup Methods
    private func applyColor() {
        switch buttonColor {
        case .white:
            titleLabel.textColor = UIColor(named: Colors.white.rawValue)
        case .primary:
            titleLabel.textColor = UIColor(named: Colors.primary.rawValue)
        }
    }

    private func configureGestures() {
        addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(didTouchDown), for: .touchDown)
    }

    // MARK: - Touch Handlers
    @objc private func didTouchUpInside() {
        alpha = 1.0
    }

    @objc private func didTouchDown() {
        alpha = 0.8
    }
}

// MARK: - View Configuration Protocol
extension LinkButton: ViewConfiguration {
    func configViews() {
        titleLabel.text = text
        applyColor()
        configureGestures()
    }

    func buildViews() {
        addSubview(containerView)
        containerView.addArrangedSubview(titleLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 44),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}