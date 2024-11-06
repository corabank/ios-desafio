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
        textField.isSecureTextEntry = true
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
                                                              style: .disabled,
                                                              iconPosition: .right,
                                                              title: "Próximo",
                                                              icon: .icArrowRight)
    
    private var viewModel: LoginPasswordViewModelProtocol
    let kBottomConstraintConstant: CGFloat = -16.0
    var kBottomConstraint: NSLayoutConstraint?
    
    init(viewModel: LoginPasswordViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        registerForKeyboardEvents()
        configBindings()
        setupViews()
    }
    
    deinit {
        unregisterFromKeyboardEvents()
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
    
    private func configBindings() {
        viewModel.isActionEnabled = { [actionButton] isEnabled in
            isEnabled ? actionButton.setStyle(with: .primary) : actionButton.setStyle(with: .disabled)
        }
    }
    
    @objc func hidePassword() {
        textView.isSecureTextEntry = !textView.isSecureTextEntry
    }
    
    @objc func nextButtonAction() {
        viewModel.next()
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
        kBottomConstraint = actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                                 constant: kBottomConstraintConstant - (Notification.keyboardSize?.height ?? 0.0))
        kBottomConstraint?.isActive = true
        
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

extension LoginPasswordViewController: UITextFieldDelegate {}

extension LoginPasswordViewController: KeyboardObserving {
    func keyboardWillShow(_ notification: Notification) {
        let bottomConstraint = kBottomConstraintConstant - (notification.keyboardSize?.height ?? 0.0)
        kBottomConstraint?.constant = bottomConstraint
        
        UIView.animate(withDuration: 0) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        kBottomConstraint?.constant = kBottomConstraintConstant
        
        UIView.animate(withDuration: 0) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
}
