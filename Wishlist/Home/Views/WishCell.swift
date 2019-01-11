//
//  WishCell.swift
//  Wishlist
//
//  Created by William GOSSARD on 08/01/2019.
//  Copyright © 2019 William GOSSARD. All rights reserved.
//

import UIKit

class WishCell: UICollectionViewCell {
    
    private var titleLabel: UILabel = {
        var l = UILabel()
        l.text = "title yeah"
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var bgImageView: UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "pandaroux")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        
        iv.addSubview(overlay)

        return iv
    }()
    
    private lazy var overlay: UIView = {
        var v = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        v.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }

    private func setupView() {
        
        addSubview(bgImageView)
        addSubview(titleLabel)

        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bgImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bgImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
