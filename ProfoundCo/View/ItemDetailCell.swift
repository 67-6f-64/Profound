//
//  ItemDetailCell.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/21/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

class ItemDetailCell: UITableViewCell {
    
    // MARK: - Properties
    
    var item: Item? {
        didSet {
            itemImageView.image = item?.image
            configureItemInfoLabel()
            configureItemDescription()
        }
    }
    
    var sizeOptions: SizeOptions!
    
    let sizePicker: UIPickerView = {
        let pv = UIPickerView()
        return pv
    }()
    
    let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .lightGray
        iv.clipsToBounds = true
        return iv
    }()
    
    let itemInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var pickerTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .line
        tf.backgroundColor = .clear
        tf.text = "Small"
        tf.inputView = sizePicker
        tf.textAlignment = .center
        tf.font = UIFont.boldSystemFont(ofSize: 12)
        return tf
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle(MSG_ADD_TO_CART, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleAddToCart), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    @objc func handleAddToCart() {
        print("DEBUG: Handle add to cart here..")
    }
    
    @objc func handleDone() {
        endEditing(true)
    }
    
    func configureItemInfoLabel() {
        guard let item = self.item else { return }
        let attributedText = NSMutableAttributedString(string: "\(item.title)\n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "$\(item.price)0\n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
        attributedText.append(NSAttributedString(string: MSG_SELECT_SIZE, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]))
        itemInfoLabel.attributedText = attributedText
    }
    
    func configureItemDescription() {
        guard let item = self.item else { return }
        let attributedText = NSMutableAttributedString(string: "DESCRIPTION OF PRODUCT\n\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "DESCRIPTION OF PRODUCT:\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]))
        attributedText.append(NSAttributedString(string: "\(item.description)\n\n\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        attributedText.append(NSAttributedString(string: "FABRIC & FIT\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]))
        attributedText.append(NSAttributedString(string: "-Light Cotton/Linen Blend Body-Front\n\n\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        attributedText.append(NSAttributedString(string: "SPECIAL DETAILS\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]))
        attributedText.append(NSAttributedString(string: "-YKK Zip Closure\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        attributedText.append(NSAttributedString(string: "-Printed Pattern", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        productDescriptionLabel.attributedText = attributedText
    }
    
    func configureViewComponents(withIndexPath indexPath: IndexPath) {
        if indexPath.row == 0 {
            configurePickerView()
            
            addSubview(itemImageView)
            itemImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 500)
            
            addSubview(itemInfoLabel)
            itemInfoLabel.anchor(top: itemImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 4, paddingBottom: 0, paddingRight: 4, width: 0, height: 0)
            
            addSubview(pickerTextField)
            pickerTextField.anchor(top: itemInfoLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 18, paddingBottom: 0, paddingRight: 18, width: 0, height: 40)
            
            addSubview(addToCartButton)
            addToCartButton.anchor(top: pickerTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        } else {
            addSubview(productDescriptionLabel)
            productDescriptionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        }
        selectionStyle = .none 
    }
}

extension ItemDetailCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func configurePickerView() {
        sizePicker.delegate = self
        sizePicker.dataSource = self
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(handleDone))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        pickerTextField.inputAccessoryView = toolbar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        sizeOptions = SizeOptions(index: row)
        return sizeOptions.description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sizeOptions = SizeOptions(index: row)
        pickerTextField.text = sizeOptions.description
    }

}
