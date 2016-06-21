//
//  RequestsViewController.swift
//  facebookSampiJoe
//
//  Created by Joseph Perri Albanese on 5/19/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController {
    @IBOutlet weak var requestsScrollView: UIScrollView!
    @IBOutlet weak var peopleImageView: UIImageView!

    override func viewDidLoad(){
        super.viewDidLoad()

        
        requestsScrollView.contentSize = CGSize(width:peopleImageView.image!.size.width, height:peopleImageView.image!.size.height + 0)
        
        // Do any additional setup after loading the view.
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
