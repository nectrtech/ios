//
//  ViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-05-26.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Foundation

class HomeViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var createPool: btnRound!
    @IBOutlet weak var userPools: btnRound!
    @IBOutlet weak var fbProfilePicture: FBSDKProfilePictureView!
    @IBOutlet weak var userName: UILabel!
    
    var userProfileFull = [UserProfileData]()
    
    private var latestAccessToken: String!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //checkCred()
        /*
        if (FBSDKAccessToken.currentAccessToken() != nil) {
        if FBSDKAccessToken.currentAccessToken().hasGranted("public_profile")
        {
        self.fbProfilePicture.profileID = "me"
        
        let userFBRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        userFBRequest.startWithCompletionHandler({ (connection, result, error: NSError!) -> Void in
            
            let userResult = result as? NSDictionary
            self.userName.text = userResult?["name"] as? String
            
            
            if (error == nil)
            {
                //print("\(userResult)")
                
            }
            else
            {
                print("\(error)")
                
                let loginError = UIAlertController(title: "Oops", message: "There was a problem logging in. Please try again.", preferredStyle: .Alert)
                loginError.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in }))
                self.presentViewController(loginError, animated: true, completion: nil)
            }
        })
        }
        else
        {
            //self.dismissViewControllerAnimated(true, completion: nil)
        }
        }
        */
        
        //checkCred()
        
        maskProfilePhoto()
        
    }
    
    func maskProfilePhoto() {
        var maskingImage = UIImage(named: "polygon")!
        var maskingLayer = CALayer()
        maskingLayer.contentsGravity = kCAGravityResizeAspect
        maskingLayer.frame = fbProfilePicture.bounds
        maskingLayer.contents = maskingImage.CGImage
        fbProfilePicture.layer.mask = maskingLayer
        fbProfilePicture.clipsToBounds = true
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        checkCred()
    }
    
    func checkCred() {
        if (FBSDKAccessToken.currentAccessToken() == nil) {
            
            navigationController?.performSegueWithIdentifier("loginUser", sender: self)
            //self.performSegueWithIdentifier("loginUser", sender: self)
            
        }
        else
        {
            
            if FBSDKAccessToken.currentAccessToken().hasGranted("public_profile")
            {
                self.fbProfilePicture.profileID = "me"
                
                let userFBRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
                userFBRequest.startWithCompletionHandler({ (connection, result, error: NSError!) -> Void in
                    
                    let userResult = result as? NSDictionary
                    var testID = userResult?["id"] as? String ?? ""
//                    print(testID)
                    self.userName.text = userResult?["name"] as? String ?? "Satoshi Nakamoto"
//                    self.navigationItem.title = self.userName.text
                    self.navigationItem.title = "Welcome"
                    
                    self.fbProfilePicture.setNeedsImageUpdate()
                    
//                    let myProfilePicURL = NSURL(string: "http://graph.facebook.com/\(testID)/picture?width=200&height=200")
//                    let imageData = NSData(contentsOfURL: myProfilePicURL!)
//                    let userImage = UIImage(data: imageData!)
                    
//                    print(myProfilePicURL)
                    
                    if (error == nil)
                    {
                        //print("\(userResult)")
                        
                    }
                    else
                    {
                        print("\(error)")
                        
                        let loginError = UIAlertController(title: "Oops", message: "\(error.localizedDescription) Please make sure you're internet is working.", preferredStyle: .Alert)
                        loginError.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in }))
                        self.presentViewController(loginError, animated: true, completion: nil)
                        
                    }
                })
            }
            else
            {
                //self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    @IBAction func createNewPool(sender: UIButton) {
//        let vc: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as UIViewController
//        self.presentViewController(vc, animated: false, completion: nil)
        
    }
    @IBAction override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}