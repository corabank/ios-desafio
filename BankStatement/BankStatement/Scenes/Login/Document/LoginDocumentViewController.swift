import UIKit

final class LoginDocumentViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem-vindo de volta!"
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Qual seu CPF?"
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
        textField.backgroundColor = .primary
        return textField
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
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func nextButtonAction() {
        viewModel.routeToPassword()
    }
    
    @objc func textEditing() {
        viewModel.documentDidChange(text: textView.text ?? "")
    }
}

extension LoginDocumentViewController: ViewConfiguration {
    func configViews() {
        view.backgroundColor = .white
        
        actionButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    func buildViews() {
        [titleLabel,
         subtitleLabel,
         textView,
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
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            textView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 24),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            textView.heightAnchor.constraint(equalToConstant: 32),
            
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
        ])
    }
}

extension LoginDocumentViewController: UITextFieldDelegate {
    
}
