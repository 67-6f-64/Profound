//
//  HomeController.swift
//  ProfoundCo
//
//  Created by Stephen Dowless on 9/19/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"
private let headerReuseIdentifier = "HomeHeader"

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: HomeControllerDelegate?
    var collectionView: UICollectionView!
    var items = [Item]()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        configureItemsArray()
    }
    
    // MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(withMenuOption: nil)
    }
    
    @objc func handleSearchTapped() {
        print("Handle search tapped..")
    }
    
    func configureItemsArray() {
        let item1 = Item(title: ITEM_TITLE_1, price: ITEM_PRICE_1, image: ITEM_IMAGE_1!, description: ITEM_DESCRIPTION_1)
        items.append(item1)
        
        let item2 = Item(title: ITEM_TITLE_2, price: ITEM_PRICE_2, image: ITEM_IMAGE_2!, description: ITEM_DESCRIPTION_2)
        items.append(item2)
        
        let item3 = Item(title: ITEM_TITLE_3, price: ITEM_PRICE_3, image: ITEM_IMAGE_3!, description: ITEM_DESCRIPTION_3)
        items.append(item3)
        
        let item4 = Item(title: ITEM_TITLE_4, price: ITEM_PRICE_4, image: ITEM_IMAGE_4!, description: ITEM_DESCRIPTION_4)
        items.append(item4)
        
        collectionView.reloadData()
    }
    
    func configureViewComponents() {
        configureCollectionView()
        configureNavigationBar()
        view.backgroundColor = .white
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Profound Aesthetic"
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "baseline_menu_black_36dp")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearchTapped))
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let frame = CGRect(x: 0, y: 44, width: view.frame.width, height: view.frame.height)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white 
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(HomeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
        view.addSubview(collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! HomeHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCell
        cell.item = items[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemDetailController = ItemDetailController()
        itemDetailController.item = items[indexPath.row]
        navigationController?.pushViewController(itemDetailController, animated: true)
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let height: CGFloat = 220
        let width = view.frame.width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = (view.frame.height - 80) / 2
        let width = (view.frame.width - 12) / 2
        
        return CGSize(width: width, height: height)
    }
}
