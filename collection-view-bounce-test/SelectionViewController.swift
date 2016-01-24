//
//  SelectionViewControllerCollectionViewController.swift
//  collection-view-bounce-test
//
//  Created by Peter Sparago on 1/24/16.
//  Copyright © 2016 Angelware. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SelectionViewController: UICollectionViewController {
    
    var selectedIndexPath: NSIndexPath? = nil
    
    override func loadView() {
        super.loadView()
        
        self.collectionView!.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.collectionView!.backgroundColor = UIColor.lightGrayColor()
        self.collectionView!.alpha = 1.0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(SelectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        print("cellforitematindexpath indexPath=\(indexPath)")
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SelectionCell
        if self.selectedIndexPath != nil && indexPath == selectedIndexPath {
            cell.select()
        } else {
            cell.unselect()
        }
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("didselectitematindexpath indexPath=\(indexPath)")
        if let selected = self.selectedIndexPath {
            if let cell = self.collectionView!.cellForItemAtIndexPath(selected) as? SelectionCell {
                cell.unselect()
            }
        }
        self.selectedIndexPath = indexPath
        if let cell = self.collectionView!.cellForItemAtIndexPath(indexPath) as? SelectionCell {
            cell.select()
            cell.bounceView()
            self.collectionView!.scrollToItemAtIndexPath(indexPath, atScrollPosition: .CenteredHorizontally, animated: true)
        }
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
