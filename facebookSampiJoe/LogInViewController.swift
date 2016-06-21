//
//  LogInViewController.swift
//  facebookSampiJoe
//
//  Created by Joseph Perri Albanese on 5/26/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    var logoInitialY: CGFloat!
    var logoOffset: CGFloat!
    var fieldSuperviewInitialY: CGFloat!
    var fieldSuperviewOffset: CGFloat!
    var labelSuperviewInitialY: CGFloat!
    var labelSuperviewOffset: CGFloat!
    
    @IBOutlet weak var fbLogoImageView: UIImageView!
    @IBOutlet weak var fieldSuperview: UIView!
    @IBOutlet weak var labelSuperview: UIView!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logInActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        logoInitialY = fbLogoImageView.frame.origin.y
        logoOffset = -70
        fieldSuperviewInitialY = fieldSuperview.frame.origin.y
        fieldSuperviewOffset = -110
        labelSuperviewInitialY = labelSuperview.frame.origin.y
        labelSuperviewOffset = -230
        
        logInActivityIndicator.hidden = true
        logInButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        fbLogoImageView.frame.origin.y = logoInitialY + logoOffset
        fieldSuperview.frame.origin.y = fieldSuperviewInitialY + fieldSuperviewOffset
        labelSuperview.frame.origin.y = labelSuperviewInitialY + labelSuperviewOffset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fbLogoImageView.frame.origin.y = logoInitialY
        fieldSuperview.frame.origin.y = fieldSuperviewInitialY
        labelSuperview.frame.origin.y = labelSuperviewInitialY
    }
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func editingChanged(sender: AnyObject) {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            logInButton.enabled = false
        } else {
            logInButton.enabled = true
        }
    }
    
    @IBAction func onLogIn(sender: AnyObject) {
        logInButton.selected = true
        logInActivityIndicator.hidden = false
        logInActivityIndicator.startAnimating()
        
        delay(2.0) {
            self.logInButton.selected = false
            self.logInActivityIndicator.hidden = true
            self.logInActivityIndicator.stopAnimating()
            
            if self.emailTextField.text == "sampo" && self.passwordTextField.text == "zekret" {
                self.performSegueWithIdentifier("signInSegue", sender: nil)
            }
            else {
                let alertController = UIAlertController(title: "Incorrect Email/Password Combination", message: "YOU GOT IT WRONG", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Okay", style: .Cancel, handler: { (action) in
                })
                alertController.addAction(cancelAction)
                
                self.presentViewController(alertController, animated: true) {
                
                }
            }
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
