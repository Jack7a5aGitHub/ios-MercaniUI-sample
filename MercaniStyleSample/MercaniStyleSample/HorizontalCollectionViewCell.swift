//
//  HorizontalCollectionViewCell.swift
//  MercaniStyleSample
//
//  Created by Jack Wong on 2018/05/28.
//  Copyright © 2018 Jack. All rights reserved.
//

import UIKit

final class HorizontalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var verticalCollectionView: UICollectionView!
    
    private let verticalCollectionProvider = VerticalCollectionProvider()
    private let verticalColorItems = [UIColor.black, .green, .yellow]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var identifier: String {
        return self.className
    }
    
    static var nibName: String {
        return self.className
    }
    /// セルの中のCollectionViewを設置する。
    func setupVerticalCollectionView(){
        verticalCollectionProvider.set(items: verticalColorItems)
        verticalCollectionView.dataSource = verticalCollectionProvider
        verticalCollectionView.delegate = self
        verticalCollectionView.register(UINib(nibName: VerticalCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: VerticalCollectionViewCell.className)
        verticalCollectionView.contentInset = UIEdgeInsetsMake(65, 0, 0, 0)
        
    }
}

extension HorizontalCollectionViewCell: UICollectionViewDelegate {
    
}

extension HorizontalCollectionViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case verticalCollectionView:
            return CGSize(width: 100, height: 100)
        default:
            break
        }
        return CGSize(width:0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
