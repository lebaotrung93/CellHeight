import UIKit

class ViewController: UIViewController {
  @IBOutlet private var collectionView: UICollectionView!
    var data = Array(repeating: false, count: 10)
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
//    collectionView.collectionViewLayout = createLayout()
  }

  private func createLayout() -> UICollectionViewLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
    section.interGroupSpacing = 16

    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
    cell.isOpen = data[indexPath.row]
    cell.resize = { [weak self] in
        self?.data[indexPath.row] = !(self?.data[indexPath.row] ?? false)
        self?.collectionView.reloadItems(at: [indexPath])
    }
    return cell
  }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return data[indexPath.row] ? CGSize(width: collectionView.bounds.width, height: 200) : CGSize(width: collectionView.bounds.width, height: 60)
    }
}
