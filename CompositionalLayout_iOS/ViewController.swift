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
