import UIKit

public final class FilterCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var selectionIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setTitle(with title: String, isSelected: Bool) {
        titleLabel.text = title
        
        titleLabel.font = isSelected ? UIFont.designFont(size: .bodyTwo, weight: .bold) : UIFont.designFont(size: .bodyTwo, weight: .regular)
        titleLabel.textColor = isSelected ? Colors.primary.uiColor : Colors.grayOne.uiColor
        selectionIndicator.backgroundColor = isSelected ? Colors.primary.uiColor : .clear
    }
}

extension FilterCell: ViewConfiguration {
    public func configViews() {}

    public func buildViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(selectionIndicator)
    }

    public func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            selectionIndicator.heightAnchor.constraint(equalToConstant: 1),
            selectionIndicator.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            selectionIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            selectionIndicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
