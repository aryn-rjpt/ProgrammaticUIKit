import UIKit

class ProgressTile: UIView {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var logo: UIImageView!
    @IBOutlet private weak var totalAmountLabel: UILabel!
    @IBOutlet private weak var transactionCountLabel: UILabel!
    @IBOutlet private weak var currentAmountLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var progressLine: UIProgressView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {

        Bundle.main.loadNibNamed("ProgressTile", owner: self)

        addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        logo.layer.cornerRadius = logo.frame.width / 2
        logo.clipsToBounds = true
    }

    func setContent(tileData: TileData, tileTintColor: UIColor) {
        self.logo.image                         = UIImage(systemName: tileData.logo)
        self.titleLabel.text                    = tileData.title
        self.totalAmountLabel.text              = "$\(tileData.totalAmount)"
        self.currentAmountLabel.text            = "$\(tileData.currentAmount)"
        self.transactionCountLabel.text         = "\(tileData.transactionCount) transactions"
        self.progressLine.progress              = Float(tileData.currentAmount) / Float(tileData.totalAmount)
        self.progressLine.progressTintColor     = tileTintColor
        self.logo.tintColor                     = tileTintColor
    }

}
