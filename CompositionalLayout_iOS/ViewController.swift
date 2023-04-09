//
//  ViewController.swift
//  CompositionalLayout_iOS
//
//  Created by 오킹 on 2023/04/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let items = ["가나다", "가나다라", "가나", "가나다라마", "가", "가나다라마바사", "가나다라마바사아", "가", "가나다라마바사아자", "가나다라마바사아자차카", "가", "가나", "가나다라", "가나다", "가나다라", "가나", "가나다라마", "가", "가나다라마바사", "가나다라마바사아", "가", "가나다라마바사아자", "가나다라마바사아자차카", "가", "가나", "가나다라", "가나다", "가나다라", "가나", "가나다라마", "가", "가나다라마바사", "가나다라마바사아", "가", "가나다라마바사아자", "가나다라마바사아자차카", "가", "가나", "가나다라", "가나다", "가나다라", "가나", "가나다라마", "가", "가나다라마바사", "가나다라마바사아", "가", "가나다라마바사아자", "가나다라마바사아자차카", "가", "가나", "가나다라"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createBasicListLayout()
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.tagLabel.text = items[indexPath.row]
        
        return cell
    }
}

extension ViewController {
    
    func createBasicListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(80),
                                             heightDimension: .absolute(48.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(48.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
        // 아이템 간격 설정
        group.interItemSpacing = .flexible(10)
        
        let section = NSCollectionLayoutSection(group: group)
        // 그룹 간격 설정
        section.interGroupSpacing = 10
        // 섹션 인셋 설정
        section.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 2, trailing: 2)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
