//
//  HorizontalCollectionProvider.swift
//  MercaniStyleSample
//
//  Created by Jack Wong on 2018/05/28.
//  Copyright © 2018 Jack. All rights reserved.
//

import UIKit

final class HorizontalCollectionProvider: NSObject {
    private var colorItems = [UIColor]()
    
    func set(items: [UIColor]) {
        self.colorItems = items
    }
}

extension HorizontalCollectionProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ///foodItemsの数を応じてHorizontal Cellを作る
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let horizontalCell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.className, for: indexPath) as? HorizontalCollectionViewCell else {
            fatalError()
        }
        horizontalCell.verticalCollectionView.backgroundColor = .white
        horizontalCell.setupVerticalCollectionView()
        return horizontalCell
    }
}

