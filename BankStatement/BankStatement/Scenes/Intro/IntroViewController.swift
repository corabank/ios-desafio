import UIKit

final class IntroViewController: UIViewController {
    private lazy var coverImage: UIImageView = {
        let imageView = UIImageView()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
    }
}

extension IntroViewController: ViewConfiguration {
    func configViews() {
        
    }
    
    func buildViews() {
        
    }
    
    func setupConstraints() {
        
    }
}
