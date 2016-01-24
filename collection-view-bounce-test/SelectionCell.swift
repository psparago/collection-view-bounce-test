//
//  SelectionCell.swift
//  collection-view-bounce-test
//
//  Created by Peter Sparago on 1/24/16.
//  Copyright © 2016 Angelware. All rights reserved.
//

import UIKit

class SelectionCell: UICollectionViewCell {
    
    var borderView: UIView!
    var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    
        self.backgroundColor = UIColor.clearColor()
        self.clipsToBounds = false
        
        self.imageView = UIImageView(frame: CGRectInset(CGRectMake(0, 0, frame.size.width, frame.size.height), 10, 10))
        self.imageView.contentMode = .ScaleAspectFit
        self.imageView.clipsToBounds = true
        self.contentView.addSubview(imageView)
        
/*
        self.maskView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)))
        self.maskView!.backgroundColor = UIColor.lightGrayColor()
        self.maskView!.alpha = 0.0
        self.contentView.insertSubview(maskView!, aboveSubview: imageView)
*/
        self.borderView = UIView(frame: CGRectInset(CGRectMake(0, 0, frame.size.width, frame.size.height), 5, 5))
        self.borderView.backgroundColor = UIColor.whiteColor();
        self.contentView.insertSubview(self.borderView, atIndex: 0)
    }

    func select() {
        self.borderView!.backgroundColor = UIColor.redColor()
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: {
            self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.10, 1.10)
            }, completion: {
                finished in
        })
    }
    
    func unselect() {
        self.borderView!.backgroundColor = UIColor.whiteColor()
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: {
            self.transform = CGAffineTransformIdentity
            }, completion: {
                finished in
        })
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        if let image = self.imageView.image {
            UIGraphicsBeginImageContextWithOptions(image.size, false, 1.0)
            let playButton = UIImage(named: "play32.png")
            let playPoint = CGPointMake(0, 0)
            playButton!.drawAtPoint(playPoint)
            UIGraphicsEndImageContext()
        }
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
/*
        self.maskView!.alpha = 0.0
        self.layer.shouldRasterize = false;
        if layoutAttributes is CoverFlowLayoutAttributes {
            let attributes = layoutAttributes as! CoverFlowLayoutAttributes
            self.layer.shouldRasterize = attributes.shouldRasterize;
            self.maskView!.alpha = attributes.maskingValue;
        }
*/
    }
}
