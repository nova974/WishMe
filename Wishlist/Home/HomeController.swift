//
//  HomeViewController.swift
//  Wishlist
//
//  Created by William GOSSARD on 04/01/2019.
//  Copyright © 2019 William GOSSARD. All rights reserved.
//

import UIKit
import SwiftLinkPreview

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let slp = SwiftLinkPreview()
    
    private let urls = ["https://badmania.fr/badminton-astrox-22-9fp1373.html", "https://www.archiduchesse.com/fr/bouclette/202-rouge-maison-close.html", "https://www.leslipfrancais.fr/le-marius-sapin-boxer-court-12283.html"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(WishCell.self, forCellWithReuseIdentifier: "cellId")
        
//        for url in urls {
//            slp.preview(url,
//                        onSuccess: { (response) in print("\(response)") },
//                        onError: { (error) in print("\(error)") })
//        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! WishCell
        cell.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 150)
    }
}

