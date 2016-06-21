//
//  FeedViewController.swift
//  facebookSampiJoe
//
//  Created by Joseph Perri Albanese on 5/19/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    var refreshControl: UIRefreshControl!
    var imageTransition: ImageTransition!

    
    @IBOutlet weak var selectedImage: UIImageView!

    
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedActivityIndicator: UIActivityIndicatorView!
    
    
    var selectedImageIndex: Int = 0


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // We tried this first but found an easier route which was to take the dimensions of the imageview.
        // feedScrollView.contentSize = CGSize(width:320, height: 1000)
        
        feedScrollView.contentSize = CGSize(width:feedImageView.image!.size.width, height: feedImageView.image!.size.height + 106)
        
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        feedScrollView.insertSubview(refreshControl, atIndex: 0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    override func viewWillAppear(animated: Bool) {
//            feedActivityIndicator.startAnimating()
//            feedImageView.hidden = true
//    }
    
//    override func viewDidAppear(animated: Bool) {
//        delay(2.0) {
//            self.feedActivityIndicator.hidden = true
//            self.feedImageView.hidden = false

    
    func onRefresh() {
    delay(2.0) { 
        self.refreshControl.endRefreshing()
        }
    
    }

    
    @IBAction func photoWasTapped(sender: UITapGestureRecognizer) {
        selectedImage = sender.view as! UIImageView
        selectedImageIndex = sender.view!.tag
        performSegueWithIdentifier("detailTapped", sender: self)
        
    }

    
    
    
// Passing my data through my prepareForSegue

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print("segued!")
        
        var destinationViewController = segue.destinationViewController as! PhotoDetailViewController
            
        // This is passing my photo data over
        destinationViewController.image = self.selectedImage.image
        
        // This will set the presentation style for my transition
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Set the instance of fadetransition
       imageTransition = ImageTransition()
        
        
        destinationViewController.transitioningDelegate = imageTransition
        
        imageTransition.duration = 1.0
        


    }


}
