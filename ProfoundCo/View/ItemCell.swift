//
//  ItemCell.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/19/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var item: Item? {
        didSet {
            itemImageView.image = item?.image
            itemDescriptionLabel.text = item?.title
            itemPriceLabel.text = "$\(item?.price ?? 0.00)0 USD"
        }
    }
    
    let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    let itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(itemImageView)
        itemImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 250)
        
        addSubview(itemDescriptionLabel)
        itemDescriptionLabel.anchor(top: itemImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(itemPriceLabel)
        itemPriceLabel.anchor(top: itemDescriptionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}
