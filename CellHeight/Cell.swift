import UIKit

class Cell: UICollectionViewCell {
  @IBOutlet private var detailsView: UIView!

  var resize: (() -> Void)?

  override func awakeFromNib() {
    super.awakeFromNib()
    contentView.layer.cornerRadius = 10
  }

  @IBAction private func toggleDetails() {
    detailsView.isHidden.toggle()
    resize?()
  }
}
