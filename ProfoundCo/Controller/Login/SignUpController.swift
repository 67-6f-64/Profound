//
//  SignUpController.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/19/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    
    // MARK: - Properties
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = MSG_PROFOUND_AESTHETIC
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    lazy var emailContainerView: UIView = {
        let image = UIImage(named: "outline_mail_outline_black_36dp")
        return templateInputContainerView(image: image!, textField: emailTextField)
    }()
    
    lazy var fullnameContainerView: UIView = {
        let image = UIImage(named: "outline_person_outline_black_36dp")
        return templateInputContainerView(image: image!, textField: fullnameTextField)
    }()
    
    lazy var passwordContainerView: UIView = {
        let image = UIImage(named: "outline_lock_black_36dp")
        return templateInputContainerView(image: image!, textField: passwordTextField)
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = templateTextField(withPlaceolder: "Email", isSecureTextEntry: false)
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = templateTextField(withPlaceolder: "Password", isSecureTextEntry: true)
        return tf
    }()
    
    lazy var fullnameTextField: UITextField = {
        let tf = templateTextField(withPlaceolder: "Full Name", isSecureTextEntry: false)
        return tf
    }()
    
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN UP", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
    }
    
    // MARK: - Handlers
    
    @objc func handleSignUp() {
        print("DEBUG: Handle sign up here..")
    }
    
    @objc func handleShowLogin() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func configureViewComponents() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 88, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 32, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 50)
        
        view.addSubview(fullnameContainerView)
        fullnameContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 50)
        
        view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: fullnameContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 50)
        
        view.addSubview(signupButton)
        signupButton.anchor(top: passwordContainerView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 36, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: view.frame.width - 48, height: 50)
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    }
}
