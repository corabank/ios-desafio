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

extension LoginDocumentViewController: UITextViewDelegate {
    
}
