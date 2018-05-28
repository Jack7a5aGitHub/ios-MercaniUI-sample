//
//  VerticalCollectionProvider.swift
//  MercaniStyleSample
//
//  Created by Jack Wong on 2018/05/28.
//  Copyright © 2018 Jack. All rights reserved.
//

import UIKit

final class VerticalCollectionProvider: NSObject {
    
    private var verticalColorItems = [UIColor]()
    func set(items: [UIColor]){
        self.verticalColorItems = items
    }
}

extension VerticalCollectionProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return verticalColorItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let verticalCell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionViewCell.className, for: indexPath) as? VerticalCollectionViewCell else {
            fatalError()
        }
        verticalCell.backgroundColor = verticalColorItems[indexPath.item]
        
        return verticalCell
    }
}
