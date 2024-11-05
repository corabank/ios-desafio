import UIKit

final class StatementViewController: UIViewController {
    private lazy var statementLabel: UILabel = {
        let label = UILabel()
        label.text = "Statement"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(statementLabel)
        view.backgroundColor = .white
        statementLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        statementLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
