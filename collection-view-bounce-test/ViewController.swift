//
//  ViewController.swift
//  collection-view-bounce-test
//
//  Created by Peter Sparago on 1/23/16.
//  Copyright © 2016 Angelware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let thumbnail16x9Size = CGSizeMake(130, 97)
    let thumbnail4x3Size = CGSizeMake(130, 130)

    var thumbnailSize = CGSizeZero
    
    var selectionController: SelectionViewController!
    
    var containingView: UIView!
    var containedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.thumbnailSize = self.thumbnail4x3Size
        
        self.containingView = UIView()
        self.containingView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(self.containingView)
        
        self.containedView = UIView()
        self.containedView.backgroundColor = UIColor.redColor()
        self.containedView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "handleTap:"))
        self.containingView.addSubview(self.containedView)

        self.selectionController = SelectionViewController(collectionViewLayout: CenteringFlowLayout(itemSize: self.thumbnailSize))
        self.addChildViewController(self.selectionController)
        self.view.addSubview(self.selectionController.view)
        self.selectionController.didMoveToParentViewController(self)
    
    }

    override func viewDidLayoutSubviews() {
        let b = self.view.bounds
        
        let containingFrame = CGRectMake(b.origin.x + (b.size.width / 2 - 100),
                                                       b.origin.y + (b.size.height / 2 - 100),
                                                       200, 200)
        self.containingView.frame = containingFrame
        self.containedView.frame = CGRectInset(self.containingView.bounds, 10, 10)
        
        let selectionFrame = CGRectMake(b.origin.x + 5, b.origin.y + b.size.height - (thumbnailSize.height + 2),
            b.size.width - 10, self.thumbnailSize.height + 4)
        self.selectionController.view.frame = selectionFrame
        
    }


    func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .Ended {
            self.containedView.bounceView()
        }
    }
}

