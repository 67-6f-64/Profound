//
//  ProfileController.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/20/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ProfileOptionCell"

class ProfileController: UIViewController {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var profileOptions: ProfileOptions!
    
    lazy var userInfoContainerView: UIView = {
        let view = UIView()

        let initialsView = UIView()
        initialsView.backgroundColor = .black
        view.addSubview(initialsView)
        initialsView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 44, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 120)
        initialsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        initialsView.layer.cornerRadius = 120 / 2
        
        initialsView.addSubview(userInitialsLabel)
        userInitialsLabel.translatesAutoresizingMaskIntoConstraints = false
        userInitialsLabel.centerXAnchor.constraint(equalTo: initialsView.centerXAnchor).isActive = true
        userInitialsLabel.centerYAnchor.constraint(equalTo: initialsView.centerYAnchor).isActive = true
        
        view.addSubview(userInfoLabel)
        userInfoLabel.anchor(top: initialsView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        userInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(dismissButton)
        dismissButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 44, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .black
        view.addSubview(separatorView)
        separatorView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 1)
        return view
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "baseline_clear_black_36dp")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    let userInitialsLabel: UILabel = {
        let label = UILabel()
        label.text = "SD"
        label.font = UIFont.systemFont(ofSize: 56)
        label.textColor = .white
        return label
    }()
    
    let userInfoLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Stephan Dowless\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        attributedText.append(NSAttributedString(string: "dowless.stephan@gmail.com", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]))
        label.numberOfLines = 2
        label.textAlignment = .center
        label.attributedText = attributedText
        return label
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
        configureTableView()
    }
    
    // MARK: - Handlers
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func didSelect(profileOption: ProfileOptions) {
        switch profileOption {
        case .PersonalInfo:
            print("DEBUG: Did select \(profileOption.description)")
        case .OrderHistory:
            print("DEBUG: Did select \(profileOption.description)")
        case .Payment:
            print("DEBUG: Did select \(profileOption.description)")
        case .Logout:
            print("DEBUG: Did select \(profileOption.description)")
        }
    }
    
    func configureViewComponents() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(userInfoContainerView)
        userInfoContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 240)
    }
}

extension ProfileController: UITableViewDataSource, UITableViewDelegate {
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        view.addSubview(tableView)
        tableView.anchor(top: userInfoContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProfileOptionCell
        
        profileOptions = ProfileOptions(index: indexPath.row)
        cell.profileOptions = profileOptions
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        profileOptions = ProfileOptions(index: indexPath.row)
        didSelect(profileOption: profileOptions)
    }
}
