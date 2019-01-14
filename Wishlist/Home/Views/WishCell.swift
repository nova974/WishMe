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
        l.text = "Title yeah"
        l.textColor = .black
        l.font = UIFont.boldSystemFont(ofSize: 24)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private var priceLabel: UILabel = {
        var l = UILabel()
        l.text = "200 €"
        l.textColor = .black
        l.font = UIFont.boldSystemFont(ofSize: 18)
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
        v.backgroundColor = UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 0.5)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }

    private func setupView() {
        
        addSubview(bgImageView)
        addSubview(titleLabel)
        addSubview(priceLabel)

        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bgImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bgImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        titleLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true

        priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
