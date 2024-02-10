//
//  ListViewController.swift
//  TInder
//
//  Created by 澤木柊斗 on 2024/02/10.
//

import Foundation
import UIKit
class ListViewController: UIViewController, UITableViewDataSource {
    var likedName = [String]()
    
    @IBOutlet weak var PushList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        PushList.dataSource = self
        PushList.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = likedName[indexPath.row]
        return cell
    }
}
