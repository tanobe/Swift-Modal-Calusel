//
//  CarouselCollectionViewFlowLayout.swift
//  Test-Modal-calusel
//
//  Created by Kai Tanobe on 2021/12/01.
//

import UIKit

final class CarouselCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        itemSize = CGSize(width: 300, height: 600)
        scrollDirection = .horizontal
//      ↓ simulator上だと無くてもbarは表示されない。実機だと表示される。
//        UINavigationController().isNavigationBarHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return .zero } //collectionViewのオプショナル解除の方法を後々考える。あとで消す。↑
        let currentPage: CGFloat = collectionView.contentOffset.x / pageWidth


        if abs(velocity.x) > 0.6 {
            let nextPage = (velocity.x > 0) ? ceil(currentPage) : floor(currentPage)
            return CGPoint(x: nextPage * pageWidth, y: proposedContentOffset.y)
        } else {
            return CGPoint(x: round(currentPage) * pageWidth, y: proposedContentOffset.y)
        }
    }
    
    private var pageWidth: CGFloat {
        //セルの行が変わる時、その行間の余白になります。
        return collectionView!.bounds.width - 40 + minimumLineSpacing
    }
}
