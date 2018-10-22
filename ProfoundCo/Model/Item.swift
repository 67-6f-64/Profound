//
//  Item.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/19/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

struct Item {
    
    let title: String
    let price: Double
    let image: UIImage
    let description: String
    
    init(title: String, price: Double, image: UIImage, description: String) {
        self.title = title
        self.price = price
        self.image = image
        self.description = description
    }
}
