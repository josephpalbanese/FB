//
//  ImageTransition.swift
//  facebookSampiJoe
//
//  Created by Joseph Perri Albanese on 6/18/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        // This creates my temporary image view.
        let tempImageView: UIImageView = UIImageView()
        
        
        // These are my segue instructions.
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let detailViewController = toViewController as! PhotoDetailViewController
 
   
        tempImageView.image = feedViewController.selectedImage.image
        tempImageView.frame = containerView.convertRect(feedViewController.selectedImage.frame, fromView: feedViewController.selectedImage.superview)
        tempImageView.contentMode = feedViewController.selectedImage.contentMode
        tempImageView.clipsToBounds = true
        containerView.addSubview(tempImageView)
        
        feedViewController.selectedImage.hidden = true
        detailViewController.detailImageView.hidden = true

        detailViewController.view.alpha = 0
        
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: { 
            
            tempImageView.frame = CGRect(x: 0, y: 56, width: 320, height: 467)
            detailViewController.view.alpha = 1
            detailViewController.backgroundView.alpha = 1
            tempImageView.contentMode = detailViewController.detailImageView.contentMode
            
            }) { (Bool) in
            
                
                tempImageView.removeFromSuperview()
              
                feedViewController.selectedImage.hidden = false
                detailViewController.detailImageView.hidden = false
                
                self.finish()
                
        }
        
    }


    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        // This creates my temporary image view.
        let tempImageView: UIImageView = UIImageView()
        
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let detailViewController = fromViewController as! PhotoDetailViewController
        
        
    
        tempImageView.clipsToBounds = true
        containerView.addSubview(tempImageView)

        
        
        tempImageView.frame = detailViewController.detailImageView.frame
        tempImageView.contentMode = detailViewController.detailImageView.contentMode
        containerView.addSubview(tempImageView)
        feedViewController.selectedImage.hidden = true
        detailViewController.detailImageView.hidden = true
        detailViewController.detailImageView.frame = containerView.convertRect(feedViewController.selectedImage.frame, fromView: tempImageView.superview)
        
        
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: [], animations: {
        
                toViewController.view.alpha = 1
            
            
            feedViewController.feedImageView.hidden = false
            detailViewController.backgroundView.alpha = 0
            detailViewController.detailImageView.hidden = false

            
        }) { (finished: Bool) -> Void in
            
            
            tempImageView.removeFromSuperview()
            self.finish()
        }
    }


}