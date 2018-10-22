//
//  ContainerController.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/19/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    var centerController: UIViewController!
    var menuController: MenuController!
    var isExpanded = false
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCenterController()
    }
    
    // MARK: - Handlers
    
    func configureCenterController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
}

extension ContainerController: HomeControllerDelegate {
    
    func handleMenuToggle(withMenuOption menuOption: MenuOptions?) {
        if !isExpanded {
            addMenuController()
        }
        isExpanded = !isExpanded
        animateLeftPannel(shouldExpand: isExpanded, forMenuOption: menuOption)
    }
    
    func addMenuController() {
        if menuController == nil {
            let menuController = MenuController()
            menuController.delegate = self 
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animateLeftPannel(shouldExpand: Bool, forMenuOption menuOption: MenuOptions?) {
        if shouldExpand {
            animateCenterXPanelPostion(targetPosition: centerController.view.frame.width - 80)
        } else {
            animateCenterXPanelPostion(targetPosition: 0) { (finished) in
                if finished {
                    guard let menuOption = menuOption else { return }
                    self.didSelectMenuOption(menuOption: menuOption)
                }
            }
        }
    }
    
    func didSelectMenuOption(menuOption: MenuOptions) {
        switch menuOption {
        case .Shop:
            print("Did select shop..")
        case .Brand:
            print("Did select brand..")
        case .Media:
            print("Did select media..")
        case .Cart:
            self.present(CartController(), animated: true, completion: nil)
        case .Profile:
            self.present(UINavigationController(rootViewController: ProfileController()), animated: true, completion: nil)
        }
    }
    
    func animateCenterXPanelPostion(targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.centerController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
}
