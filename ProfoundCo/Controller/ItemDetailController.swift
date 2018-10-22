//
//  ItemDetailController.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/21/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemDetailCell"

class ItemDetailController: UIViewController {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var item: Item? 
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    // MARK: - Handlers
    
    func configureViewComponents() {
        view.backgroundColor = .white
        configureTableView()
    }
    
}

extension ItemDetailController: UITableViewDataSource, UITableViewDelegate {
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemDetailCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return view.frame.height - 50
        } else {
            return 320
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ItemDetailCell
        cell.item = self.item
        cell.configureViewComponents(withIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
