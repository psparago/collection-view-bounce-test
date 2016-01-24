//
//  UIExentsions.swift
//  collection-view-bounce-test
//
//  Created by Peter Sparago on 1/24/16.
//  Copyright © 2016 Angelware. All rights reserved.
//

import UIKit

extension UIView {
    
    private class AnimationDelegate : NSObject {
        let completion: (() -> Void)?
        
        init(completion: (() -> Void)?) {
            self.completion = completion
        }
        
        override func animationDidStop(theAnimation: CAAnimation, finished flag: Bool) {
            if completion != nil {
                completion!()
            }
        }
    }
    
    func bounceView(completion: (() -> Void)? = nil) {
        let animation = bounceAnimation(frame.height)
        animation.delegate = AnimationDelegate(completion: completion)
        layer.addAnimation(animation, forKey: "bounce")
    }
    
    func bounceAnimation(itemHeight: CGFloat) -> CAKeyframeAnimation {
        let factors: [CGFloat] = [0, 32, 60, 83, 100, 114, 124, 128, 128, 124, 114, 100, 83, 60, 32,
            0, 24, 42, 54, 62, 64, 62, 54, 42, 24, 0, 18, 28, 32, 28, 18, 0]
        
        var transforms: [AnyObject] = []
        for factor in factors {
            let positionOffset = factor/256.0 * itemHeight
            var transform = CATransform3DMakeTranslation(0, -positionOffset, 0)
            transform = CATransform3DConcat(self.layer.transform, transform)
            transforms.append(NSValue(CATransform3D: transform))
        }
        
        let animation = CAKeyframeAnimation(keyPath: "transform")
        
        animation.repeatCount = 1
        animation.duration = CFTimeInterval(factors.count)/30.0
        animation.fillMode = kCAFillModeForwards
        animation.values = transforms
        animation.removedOnCompletion = true // final stage is equal to starting stage
        animation.autoreverses = false
        
        return animation;
    }
}