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

    private lazy var filter = FilterBuilder.build(items: ["Filter1", "Filter2", "Filter3", "Filter4"],
                                                  displayOption: .withActionIcon,
                                                  initialSelection: 2,
                                                  delegate: self)

    private lazy var button: UIButton = CustomButtonBuilder.build(size: .medium,
                                                                  style: .primary,
                                                                  iconPosition: .right,
                                                                  title: "Exemplo de Botão",
                                                                  icon: Icons.icArrowUpOut.image)
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

        stackview.addArrangedSubview(filter)
        stackview.addArrangedSubview(button)
        stackview.addArrangedSubview(label)
        stackview.addArrangedSubview(linkButton)

        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            stackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            filter.leadingAnchor.constraint(equalTo: stackview.leadingAnchor),
            filter.trailingAnchor.constraint(equalTo: stackview.trailingAnchor),

            button.leadingAnchor.constraint(equalTo: stackview.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: stackview.trailingAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NavigationBar.apply(to: self,
                            title: "Componentes do DS",
                            rightButtonImage: Icons.icShareIos.image,
                            rightButtonAction: #selector(didTapRightButton))
    }

    @objc private func didTapRightButton() {
        print("Botão da direita foi pressionado")
    }
}

extension ViewController: FilterDelegateProtocol {
    func didSelect(item: Int) {}
    
    func didTapActionIcon() {}
}
