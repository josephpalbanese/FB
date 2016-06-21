//
//  DetailViewController.swift
//  facebookSampiJoe
//
//  Created by Joseph Perri Albanese on 5/19/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailScrollView: UIScrollView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailScrollView.contentSize = CGSize(width: detailImageView.image!.size.width, height: detailImageView.image!.size.height + 54)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func likeTapped(sender: UIButton) {
        sender.selected = true
    }
    
    @IBAction func backTapped(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
