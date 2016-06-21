//
//  SettingsViewController.swift
//  facebookSampiJoe
//
//  Created by Joseph Perri Albanese on 5/19/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        settingsScrollView.contentSize = CGSize(width: settingsImageView.image!.size.width, height: settingsImageView.image!.size.height + 120)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        let alertController = UIAlertController(title: "Are you sure you want to log out?", message: nil, preferredStyle: .ActionSheet)
        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("logoutSegue", sender: nil)
        }
        alertController.addAction(logoutAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // nothing!
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true) {
            // nothing
        }
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
