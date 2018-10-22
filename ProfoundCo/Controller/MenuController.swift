//
//  MenuController.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/19/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MenuOptionsCell"

class MenuController: UIViewController {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var centerController: UIViewController?
    var menuOptions: MenuOptions!
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
    }
    
    // MARK: - Handlers
    
    func configureViewComponents() {
        configureTableView()
        view.backgroundColor = UIColor.groupTableViewBackground
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 88, paddingLeft: 0, paddingBottom: 0, paddingRight: 80, width: 0, height: 250)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        
        menuOptions = MenuOptions(index: indexPath.row)
        cell.titleLabel.text = menuOptions.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuOptions = MenuOptions(index: indexPath.row)
        delegate?.handleMenuToggle(withMenuOption: menuOptions)
    }
}
