//
//  NotificationsViewController.swift
//  facebookSampiJoe
//
//  Created by Joseph Perri Albanese on 5/19/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var notificationsScrollView: UIScrollView!
    @IBOutlet weak var notificationsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notificationsScrollView.contentSize = CGSize(width: notificationsImageView.image!.size.width, height: notificationsImageView.image!.size.height + 60)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
