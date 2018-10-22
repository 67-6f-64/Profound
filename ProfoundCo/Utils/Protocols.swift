//
//  Protocols.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/19/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

protocol Printable {
    var description: String { get }
}

protocol HomeControllerDelegate {
    func handleMenuToggle(withMenuOption menuOption: MenuOptions?)
    func addMenuController()
    func animateLeftPannel(shouldExpand: Bool, forMenuOption menuOption: MenuOptions?)
}


