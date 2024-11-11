import UIKit
import DesignSystem

final class ViewController: UIViewController {
    private lazy var stackview: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.alignment = .center
        element.spacing = 24
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var button: UIButton = CustomButtonBuilder.build(size: .medium,
                                                                  style: .primary,
                                                                  iconPosition: .none,
                                                                  title: "Exemplo de Botão")
    private lazy var label: UILabel = {
        let element = UILabel.buildStyle(size: .bodyOne, weight: .bold, textColor: .black)
        element.text = "Exemplo de Label"
        return element
    }()

    private lazy var linkButton: LinkButton = LinkButton(text: "Exemplo de LinkButton", color: .primary)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackview)

        NavigationBar.apply(to: self,
                            title: "Componentes do DS",
                            rightButtonImage: UIImage(named: Icons.icShareIos.rawValue),
                            rightButtonAction: #selector(rightButtonPressed))

        stackview.addArrangedSubview(button)
        stackview.addArrangedSubview(label)
        stackview.addArrangedSubview(linkButton)

        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            stackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            button.leadingAnchor.constraint(equalTo: stackview.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: stackview.trailingAnchor)
        ])
    }

    @objc
    func rightButtonPressed() {
        print("rightButtonPressed")
    }
}
