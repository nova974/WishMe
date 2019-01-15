//
//  HomeViewController.swift
//  Wishlist
//
//  Created by William GOSSARD on 04/01/2019.
//  Copyright © 2019 William GOSSARD. All rights reserved.
//

import UIKit
import SwiftLinkPreview
import RealmSwift

class HomeController: UITableViewController {

    private let slp = SwiftLinkPreview()
    private let realm = try! Realm()

    private var wishList: [Wish] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .white
        tableView.register(WishCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none

        wishList = self.fetchWishlist()

        setupNavigationBarItems()
    }

    func addWish(link: String) {
        if link == "" { return }

        if canOpenURL(string: link) {

            // check if exists before insert
            let find = realm.objects(Wish.self).filter("url == \"\(link)\"")

            if find.count == 0 {
                slp.preview(link, onSuccess: { (response) in
                    let newWish = Wish()
                    newWish.canonicalUrl = response.canonicalUrl ?? link
                    newWish.url = response.url?.absoluteString ?? link
                    newWish.finalUrl = response.finalUrl?.absoluteString ?? link
                    newWish.icon = response.icon ?? ""
                    newWish.image = response.image ?? response.images![0]
                    newWish.title = response.title ?? "loading ..."
                    newWish.desc = response.description ?? ""
                    newWish.price = response.price ?? ""

                    try! self.realm.write {
                        newWish.id = newWish.incrementId()
                        self.realm.add(newWish)

                        self.wishList.append(newWish)
                        self.tableView.insertRows(at: [IndexPath(item: self.wishList.count - 1, section: 0)], with: .none)
                    }

                }, onError: { (error) in print("\(error)") })
            }
        }
    }

    func fetchWishlist() -> [Wish] {
        return Array(realm.objects(Wish.self))
    }
    
    @objc func displayAlert() {
        let alert = UIAlertController(title: "test", message: "coucou coucou coucou", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)

        let action = UIAlertAction(title: "link", style: .default) { (_) in
            let textField = alert.textFields![0] as UITextField
            self.addWish(link: textField.text ?? "")
        }

        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishList.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! WishCell
        cell.selectionStyle = .none
        cell.wish = self.wishList[indexPath.item]
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let deleteAction = UITableViewRowAction(style: .default, title: "Supprimer", handler: handlerTableViewRowAction)

        deleteAction.backgroundColor = .red
        return [deleteAction]
    }

    func handlerTableViewRowAction(action: UITableViewRowAction, index: IndexPath) {
        try! realm.write {
            // supprimer db
            realm.delete(wishList[index.item])
            wishList.remove(at: index.item)
            // supprimer row
            self.tableView.deleteRows(at: [index], with: .fade)
        }
    }

    func canOpenURL(string: String?) -> Bool {
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: string)
    }


}

