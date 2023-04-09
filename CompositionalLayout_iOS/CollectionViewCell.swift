//
//  CollectionViewCell.swift
//  CompositionalLayout_iOS
//
//  Created by 오킹 on 2023/04/09.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var tagLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 12)
        view.textColor = .black
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    private func setUI() {
        self.addSubview(tagLabel)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
        tagLabel.translatesAutoresizingMaskIntoConstraints = false

        tagLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        tagLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        tagLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        tagLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
    }
}
