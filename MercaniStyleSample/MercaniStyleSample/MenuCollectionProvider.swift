//
//  MenuCollectionProvider.swift
//  MercaniStyleSample
//
//  Created by Jack Wong on 2018/05/28.
//  Copyright © 2018 Jack. All rights reserved.
//

import UIKit

final class MenuCollectionProvider: NSObject {
    private var foodItems = [String]()
    
    func set(items: [String]){
        self.foodItems = items
    }
}

extension MenuCollectionProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.className, for: indexPath) as? MenuCollectionViewCell else {
            fatalError()
        }
        menuCell.foodLabel.text = foodItems[indexPath.item]
        return menuCell
    }
}
