//
//  SizeOptions.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/24/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

enum SizeOptions: Int, Printable {
    case Small
    case Medium
    case Large
    case ExtraLarge
    
    var description: String {
        switch self {
        case .Small: return "Small"
        case .Medium: return "Medium"
        case .Large: return "Large"
        case .ExtraLarge: return "Extra Large"
        }
    }
    
    init(index: Int) {
        switch index {
        case 0: self = .Small
        case 1: self = .Medium
        case 2: self = .Large
        case 3: self = .ExtraLarge
        default: self = .Small
        }
    }
}
