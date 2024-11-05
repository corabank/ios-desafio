import UIKit

final class LoginPasswordViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel.buildStyle(size: .titleThree,
                                       weight: .bold,
                                       textColor: .offBlack)
        label.text = "Digite sua senha de acesso"
        return label
    }()
    
    private lazy var textView: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        textField.spellCheckingType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.tintColor = .black
        textField.backgroundColor = .white
        textField.accessibilityTraits = .updatesFrequently
        textField.isAccessibilityElement = true
        textField.addTarget(self, action: #selector(textEditing), for: .editingChanged)
        return textField
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel.buildStyle(size: .bodyTwo,
                                       weight: .regular,
                                       textColor: .primary)
        label.text = "Esqueci minha senha"
        return label
    }()
    
    private lazy var actionButton = CustomButtonBuilder.build(size: .small,
                                                              style: .primary,
                                                              iconPosition: .right,
                                                              title: "Próximo",
                                                              icon: .icArrowRight)
    
    private let viewModel: LoginPasswordViewModelProtocol
    
    init(viewModel: LoginPasswordViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NavigationBar.apply(to: self,
                            title: "Login Cora",
                            rightButtonImage: nil,
                            rightButtonAction: nil)
        
        textView.becomeFirstResponder()
    }
    
    @objc func nextButtonAction() async throws {
        try await viewModel.next()
    }
    
    @objc func textEditing() {
        viewModel.passwordDidChange(text: textView.text ?? "")
    }
}

extension LoginPasswordViewController: ViewConfiguration {
    func configViews() {
        view.backgroundColor = .white
        
        actionButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
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
            
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            textView.heightAnchor.constraint(equalToConstant: 32),
            
            subtitleLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 48),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}

extension LoginPasswordViewController: UITextFieldDelegate {
    
}
