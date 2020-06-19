import UIKit

class Cell: UICollectionViewCell {
  @IBOutlet private var detailsView: UIView!
    private var _isOpsen : Bool!
  var resize: (() -> Void)?

  override func awakeFromNib() {
    super.awakeFromNib()
    contentView.layer.cornerRadius = 10
  }
    
    var isOpen : Bool {
        set {
            detailsView.isHidden = !newValue
            _isOpsen = newValue
        }
        get {
            return _isOpsen
        }
    }

  @IBAction private func toggleDetails() {
    detailsView.isHidden.toggle()
    resize?()
  }
}
