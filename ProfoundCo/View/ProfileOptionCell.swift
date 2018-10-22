//
//  ProfileOptionCell.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/20/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

class ProfileOptionCell: UITableViewCell {
    
    // MARK: - Properties
    
    var profileOptions: ProfileOptions? {
        didSet {
            titleLabel.text = profileOptions?.description
        }
    }
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}
