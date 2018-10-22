//
//  ProfileOptions.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/20/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

enum ProfileOptions: Int, Printable {
    
    case PersonalInfo
    case OrderHistory
    case Payment
    case Logout
    
    var description: String {
        switch self {
        case .PersonalInfo: return "Personal Information"
        case .OrderHistory: return "Order History"
        case .Payment: return "Payment"
        case .Logout: return "Logout"
        }
    }
    
    static var count: Int { return self.Logout.hashValue + 1 }
    
    init(index: Int) {
        switch index {
        case 0: self = .PersonalInfo
        case 1: self = .OrderHistory
        case 2: self = .Payment
        case 3: self = .Logout
        default: self = .PersonalInfo
        }
    }
    
}
