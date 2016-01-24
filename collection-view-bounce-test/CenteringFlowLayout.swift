//
//  SimpleCoverFlowLayout.swift
//  Angelshare
//
//  Created by Peter Sparago on 7/26/15.
//  Copyright (c) 2015 Angelware. All rights reserved.
//

import UIKit

class CenteringFlowLayout: UICollectionViewFlowLayout {
    
    let ZOOM_FACTOR: CGFloat = 0.25
    
    // MARK: Overridden Methods
    
    init(itemSize: CGSize) {
        super.init()
        
        // Set up our basic properties
        self.scrollDirection = .Horizontal
        self.itemSize = itemSize
        self.minimumInteritemSpacing = 400 // Makes sure we only have 1 row of items in portrait mode
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func indexPathIsCentered(indexPath: NSIndexPath) -> Bool {
        let visibleRect = CGRectMake(self.collectionView!.contentOffset.x, self.collectionView!.contentOffset.y,
            self.collectionView!.bounds.width, self.collectionView!.bounds.height)
        var distanceFromVisibleRectCenterToItemCenter : CGFloat = 0
        if let attributes = layoutAttributesForItemAtIndexPath(indexPath) {
            distanceFromVisibleRectCenterToItemCenter = CGRectGetMidX(visibleRect) - attributes.center.x
        }
        return abs(distanceFromVisibleRectCenterToItemCenter) < 10
    }

}