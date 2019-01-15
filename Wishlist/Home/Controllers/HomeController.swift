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
    
    private let urls = ["https://badmania.fr/badminton-astrox-22-9fp1373.html", "https://www.archiduchesse.com/fr/bouclette/202-rouge-maison-close.html", "https://www.leslipfrancais.fr/le-marius-sapin-boxer-court-12283.html"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .white
        tableView.register(WishCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none

        setupNavigationBarItems()
    }

    func addWish(link: String) {
        if link == "" { return }

        let realm = try! Realm()

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


                    try! realm.write {
                        realm.add(newWish)
                    }

                }, onError: { (error) in print("\(error)") })
            }
        }
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
        return urls.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! WishCell
        cell.selectionStyle = .none
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
        print("delete action")
        // supprimer db
        // supprimer row
    }

    func canOpenURL(string: String?) -> Bool {
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: string)
    }


}

