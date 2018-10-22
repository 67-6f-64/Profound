//
//  MenuOptionCell.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/19/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    
    // MARK: - Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(titleLabel)
        titleLabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 24, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true 
        
        backgroundColor = UIColor.groupTableViewBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}
