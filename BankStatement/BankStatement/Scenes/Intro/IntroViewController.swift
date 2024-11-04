import UIKit

final class IntroViewController: UIViewController {
    private lazy var coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Conta Digital PJ"
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Poderosamente simples"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Sua empresa livre burocracias e de taxas para gerar boletos, fazer transferências e pagamentos."
        return label
    }()
    
    private lazy var registerButton = CustomButtonBuilder.build(size: ButtonSize.large,
                                                                style: ButtonStyle.secondary,
                                                                iconPosition: IconPosition.right,
                                                                title: "Quero fazer parte",
                                                                icon: .icArrowRight)

    private lazy var signupButton = CustomButtonBuilder.build(size: ButtonSize.medium,
                                                             style: ButtonStyle.primary,
                                                             iconPosition: IconPosition.none,
                                                             title: "Já sou cliente",
                                                             icon: nil)
    
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
        view.backgroundColor = UIColor(named: Colors.primary.rawValue)
        
        signupButton.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
    }
    
    func buildViews() {
        [coverImage,
         titleLabel,
         subtitleLabel,
         descriptionLabel,
         registerButton,
         signupButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverImage.heightAnchor.constraint(equalToConstant: 339),
            coverImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            registerButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            signupButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 24),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}
