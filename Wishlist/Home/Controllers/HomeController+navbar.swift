//
//  HomeController+navbar.swift
//  Wishlist
//
//  Created by William GOSSARD on 10/01/2019.
//  Copyright © 2019 William GOSSARD. All rights reserved.
//

import UIKit

extension HomeController {
 
    func setupNavigationBarItems() {
        setupRightNavigationItems()
    }
    
    private func setupRightNavigationItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
}
