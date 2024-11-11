import UIKit
import DesignSystem

final class IntroViewController: UIViewController {
    private lazy var coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = DSAssets.coraCoverLogin.image
        return imageView
    }()

    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = DSAssets.coraLogoLogin.image
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel.buildStyle(size: .titleTwo,
                                       weight: .bold,
                                       textColor: Colors.white.uiColor)
        label.text = "Conta Digital PJ"
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel.buildStyle(size: .titleTwo,
                                       weight: .regular,
                                       textColor: Colors.white.uiColor)
        label.text = "Poderosamente simples"
        return label
    }()

    private lazy var titleAndSubtitleStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                       subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel.buildStyle(size: .bodyOne,
                                       weight: .regular,
                                       textColor: Colors.white.uiColor)
        label.text = "Sua empresa livre burocracias e de taxas para gerar boletos, fazer transferências e pagamentos."
        return label
    }()

    private lazy var registerButton = CustomButtonBuilder.build(size: .medium,
                                                                style: .secondary,
                                                                iconPosition: .right,
                                                                title: "Quero fazer parte!",
                                                                icon: Icons.icArrowRight.image)

    private lazy var signupButton = LinkButton(text: "Já sou cliente",
                                               color: .white)

    private lazy var buttonsStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [registerButton,
                                                       signupButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    private let coordinator: MainCoordinatorProtocol?

    init(coordinator: MainCoordinatorProtocol?) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    @objc func signupAction() {
        coordinator?.handle(event: .document)
    }
}

extension IntroViewController: ViewConfiguration {
    func configViews() {
        view.backgroundColor = Colors.primary.uiColor
        signupButton.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
    }

    func buildViews() {
        [coverImage,
         logoImage,
         titleAndSubtitleStack,
         descriptionLabel,
         buttonsStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverImage.heightAnchor.constraint(equalToConstant: 339),
            coverImage.topAnchor.constraint(equalTo: view.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -16),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoImage.heightAnchor.constraint(equalToConstant: 24),

            titleAndSubtitleStack.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 24),
            titleAndSubtitleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleAndSubtitleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            descriptionLabel.topAnchor.constraint(equalTo: titleAndSubtitleStack.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            buttonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            buttonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            buttonsStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
        ])
    }
}
