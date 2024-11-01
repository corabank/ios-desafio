import UIKit

final class LoginPasswordViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Digite sua senha de acesso"
        return label
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = false
        textView.spellCheckingType = .no
        textView.autocapitalizationType = .none
        textView.keyboardType = .numberPad
        textView.delegate = self
        textView.tintColor = .black
        textView.backgroundColor = .white
        textView.accessibilityTraits = .updatesFrequently
        textView.isAccessibilityElement = true
        return textView
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Esqueci minha senha"
        return label
    }()
    
    private lazy var actionButton = CustomButtonBuilder.build(size: ButtonSize.medium,
                                                              style: ButtonStyle.primary,
                                                              iconPosition: IconPosition.right,
                                                              title: "Próximo",
                                                              icon: .icArrowRight)
    
    private let viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // set navigations
    }
}

extension LoginPasswordViewController: ViewConfiguration {
    func configViews() {
        view.backgroundColor = .white
    }
    
    func buildViews() {
        [titleLabel,
         textView,
         subtitleLabel,
         actionButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            textView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 24),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            subtitleLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 24),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 24),
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
        ])
    }
}

extension LoginPasswordViewController: UITextViewDelegate {
    
}
