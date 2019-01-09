//
//  WishCell.swift
//  Wishlist
//
//  Created by William GOSSARD on 08/01/2019.
//  Copyright © 2019 William GOSSARD. All rights reserved.
//

import UIKit

class WishCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        var l = UILabel()
        l.text = "title yeah"
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
