//
//  MenuOptions.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/19/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

enum MenuOptions: Printable {
    case Shop
    case Brand
    case Media
    case Cart
    case Profile
    
    static var count: Int { return MenuOptions.Profile.hashValue + 1 }
    
    var description: String {
        switch self {
        case .Shop: return "Shop"
        case .Brand: return "Brand"
        case .Media: return "Media"
        case .Cart: return "Cart"
        case .Profile: return "Profile"
        }
    }
    
    init(index: Int) {
        switch index {
        case 0: self = .Shop
        case 1: self = .Brand
        case 2: self = .Media
        case 3: self = .Cart
        case 4: self = .Profile
        default: self = .Shop
        }
    }
}
