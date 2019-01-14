//
//  HomeViewController.swift
//  Wishlist
//
//  Created by William GOSSARD on 04/01/2019.
//  Copyright © 2019 William GOSSARD. All rights reserved.
//

import UIKit
import SwiftLinkPreview

class HomeController: UITableViewController {

    private let slp = SwiftLinkPreview()
    
    private let urls = ["https://badmania.fr/badminton-astrox-22-9fp1373.html", "https://www.archiduchesse.com/fr/bouclette/202-rouge-maison-close.html", "https://www.leslipfrancais.fr/le-marius-sapin-boxer-court-12283.html"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .white
        tableView.register(WishCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none

        setupNavigationBarItems()
//        for url in urls {
//            slp.preview(url,
//                        onSuccess: { (response) in print("\(response)") },
//                        onError: { (error) in print("\(error)") })
//        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! WishCell
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

}

