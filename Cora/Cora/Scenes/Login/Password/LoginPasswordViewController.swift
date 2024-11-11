import UIKit
import DesignSystem

final class LoginPasswordViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel.buildStyle(size: .titleThree,
                                       weight: .bold,
                                       textColor: Colors.offBlack.uiColor)
        label.text = "Digite sua senha de acesso"
        return label
    }()
    
    private lazy var eyeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Icons.icEyeVisible.image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.tintColor = Colors.primary.uiColor
        return imageView
    }()
    
    private lazy var textView: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        textField.spellCheckingType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.tintColor = Colors.black.uiColor
        textField.backgroundColor = Colors.white.uiColor
        textField.accessibilityTraits = .updatesFrequently
        textField.isAccessibilityElement = true
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(textEditing), for: .editingChanged)
        return textField
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel.buildStyle(size: .bodyTwo,
                                       weight: .regular,
                                       textColor: Colors.primary.uiColor)
        label.text = "Esqueci minha senha"
        return label
    }()
    
    private lazy var actionButton = CustomButtonBuilder.build(size: .small,
                                                              style: .disabled,
                                                              iconPosition: .right,
                                                              title: "Próximo",
                                                              icon: Icons.icArrowRight.image)

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
    }
    
    private func configBindings() {
        viewModel.isActionEnabled = { [actionButton] isEnabled in
            isEnabled ? actionButton.setStyle(with: .primary) : actionButton.setStyle(with: .disabled)
        }
        
        viewModel.showAuthError = {
            let alert = UIAlertController(title: "Ops!",
                                          message: "Não foi possível realizar o login.",
                                          preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil ))
            self.present(alert, animated: true)
        }
    }
    
    @objc func hidePassword() {
        if textView.isSecureTextEntry {
            eyeImageView.image = Icons.icEyeHidden.image
        } else {
            eyeImageView.image = Icons.icEyeVisible.image
        }
        textView.isSecureTextEntry = !textView.isSecureTextEntry
    }
    
    @objc func nextButtonAction() {
        Task {
            await viewModel.next()
        }
    }
    
    @objc func textEditing() {
        viewModel.passwordDidChange(text: textView.text ?? "")
    }
}

extension LoginPasswordViewController: ViewConfiguration {
    func configViews() {
        view.backgroundColor = .white
        
        actionButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hidePassword))
        eyeImageView.addGestureRecognizer(tap)
    }
    
    func buildViews() {
        [titleLabel,
         textView,
         eyeImageView,
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
            
            eyeImageView.topAnchor.constraint(equalTo: textView.topAnchor),
            eyeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            eyeImageView.heightAnchor.constraint(equalToConstant: 32),
            eyeImageView.widthAnchor.constraint(equalToConstant: 32),
            
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
