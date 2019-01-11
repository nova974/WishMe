//
//  WishModel.swift
//  Wishlist
//
//  Created by William GOSSARD on 09/01/2019.
//  Copyright © 2019 William GOSSARD. All rights reserved.
//

import Foundation
import RealmSwift

class Wish: Object {
    
    @objc dynamic var url: String?
    @objc dynamic var finalUrl: String?
    @objc dynamic var canonicalUrl: String?
    @objc dynamic var title: String?
    @objc dynamic var desc: String?
    @objc dynamic var image: String?
    @objc dynamic var icon: String?
    @objc dynamic var price: String?
}
