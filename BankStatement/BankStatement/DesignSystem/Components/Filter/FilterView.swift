import UIKit

protocol FilterDelegateProtocol: AnyObject {
    func didSelect(item: Int)
    func didTapActionIcon()
}

protocol FilterProtocol: UIView {
    func setSelected(item: Int)
    func insertNew(item: String, at index: Int)
}

enum FilterDisplayOption {
    case simple,
         withActionIcon
}

enum FilterBuilder {
    static func build(items: [String],
                             displayOption: FilterDisplayOption,
                             initialSelection: Int = 0,
                             delegate: FilterDelegateProtocol) -> FilterProtocol {
        return FilterView(items: items,
                          displayOption: displayOption,
                          initialSelection: initialSelection,
                          delegate: delegate)
    }
}

private final class FilterView: UIView {
    private var items: [String]
    private let displayOption: FilterDisplayOption
    private var selectedItem: Int
    private weak var delegate: FilterDelegateProtocol?

    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 32
        layout.minimumInteritemSpacing = 32

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: NSStringFromClass(FilterCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private lazy var actionIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Icons.icFilter.rawValue), for: .normal)
        button.tintColor = UIColor(named: Colors.primary.rawValue)
        button.addTarget(self, action: #selector(didTapActionIcon), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(items: [String],
         displayOption: FilterDisplayOption,
         initialSelection: Int,
         delegate: FilterDelegateProtocol) {
        self.items = items
        self.displayOption = displayOption
        self.selectedItem = initialSelection
        self.delegate = delegate

        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func didShowIcon() {
        if displayOption == .withActionIcon {
            contentStack.addArrangedSubview(actionIcon)
        }
    }

    @objc
    private func didTapActionIcon() {
        delegate?.didTapActionIcon()
    }
}

extension FilterView: ViewConfiguration {
    func configViews() {
        backgroundColor = UIColor(named: Colors.white.rawValue)
    }
    
    func buildViews() {
        addSubview(contentStack)
        contentStack.addArrangedSubview(collectionView)
        didShowIcon()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor),

            collectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension FilterView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = indexPath.item
        collectionView.reloadData()
        delegate?.didSelect(item: indexPath.item)
    }
}

extension FilterView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(FilterCell.self), for: indexPath) as! FilterCell
        let isSelected = indexPath.item == selectedItem
        cell.setTitle(with: items[indexPath.item], isSelected: isSelected)
        return cell
    }
}

extension FilterView: FilterProtocol {
    func setSelected(item: Int) {
        selectedItem = item
        collectionView.selectItem(at: IndexPath(item: item, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        collectionView.reloadData()
    }

    func insertNew(item: String, at index: Int) {
        items.insert(item, at: index)
        collectionView.performBatchUpdates {
            collectionView.insertItems(at: [IndexPath(item: index, section: 0)])
        }
    }
}
