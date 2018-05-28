//
//  VerticalCollectionViewCell.swift
//  MercaniStyleSample
//
//  Created by Jack Wong on 2018/05/28.
//  Copyright © 2018 Jack. All rights reserved.
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var identifier: String {
        return self.className
    }
    
    static var nibName: String {
        return self.className
    }
}
