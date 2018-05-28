//
//  MenuViewController.swift
//  MercaniStyleSample
//
//  Created by Jack Wong on 2018/05/28.
//  Copyright © 2018 Jack. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var horizontaolCollectionView: UICollectionView!
    
    //MARK: Properties
    private let menuProvider = MenuCollectionProvider()
    private let horizontalCollectionProvider = HorizontalCollectionProvider()
    private var horizontalBarLeftAnchor: NSLayoutConstraint?
    private let menuItems = ["焼肉","寿司","ラーメン","ケーキ"]
    private let horizontalColorItems = [UIColor.gray,.white,.red,.blue]
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuCollection()
        setupHorizotalCollection()
    }

}

//MARK: -Private func
extension MenuViewController {
    ///メニューを設置
    private func setupMenuCollection(){
        
        menuProvider.set(items: menuItems)
        menuCollectionView.dataSource = menuProvider
        menuCollectionView.delegate = self
        menuCollectionView.register(UINib(nibName: MenuCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: MenuCollectionViewCell.className)
        menuCollectionView.scrollIndicatorInsets = UIEdgeInsetsMake(20, 10, 0, 0)
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        menuCollectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
        setupHorizontalBar()
    }
    /// Setup Horizontal Colelction View
    private func setupHorizotalCollection(){
            horizontaolCollectionView.delegate = self
        horizontalCollectionProvider.set(items: horizontalColorItems)
            horizontaolCollectionView.dataSource = horizontalCollectionProvider
        horizontaolCollectionView.register(UINib(nibName: HorizontalCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: HorizontalCollectionViewCell.className)
    }
    
    /// アイテムの下のバーを設置する
    private func setupHorizontalBar(){
        let horizontalBar = UIView()
        horizontalBar.backgroundColor = .blue
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false
        menuView.addSubview(horizontalBar)
        horizontalBarLeftAnchor = horizontalBar.leftAnchor.constraint(equalTo: menuView.leftAnchor)
        horizontalBarLeftAnchor?.isActive = true
        horizontalBar.bottomAnchor.constraint(equalTo: menuView.bottomAnchor).isActive = true
        horizontalBar.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 1/4 ).isActive = true
        horizontalBar.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    ///メニューとHorizontal CollectionViewをリンクする。
    private func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        horizontaolCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }
    /// バーと左側のconstraintの値を更新する。
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       // print("View Did Scroll")
        horizontalBarLeftAnchor?.constant = scrollView.contentOffset.x / 4
    }
    /// Horizontal CollectionView Swipeすると上のメニューをリンクする。
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("Current Page : \(targetContentOffset.pointee.x / view.frame.width)")
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
    }
}

//MARK: -UICollectionViewDelegate
extension MenuViewController: UICollectionViewDelegate {
    
}

//MARK: -UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case menuCollectionView:
            return CGSize(width: menuView.frame.width / 4, height: menuView.frame.height)
        case horizontaolCollectionView:
            return CGSize(width: view.frame.width, height: view.frame.height)
        default:
            break
        }
        return CGSize(width: 0, height: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case menuCollectionView:
            self.scrollToMenuIndex(menuIndex: indexPath.row)
        case horizontaolCollectionView:
            print("Horizontal Cells Tapped")
        default:
            break
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
















