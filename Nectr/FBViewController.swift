//
//  FBViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-06-09.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FBViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var btnLoginFB: FBSDKLoginButton!
    private var latestAccessToken: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLoginFB.readPermissions = ["public_profile", "email", "user_friends"]
        btnLoginFB.delegate = self
        
        //print(accessToken)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        loadMainView()
        
        if ((FBSDKAccessToken.currentAccessToken()) != nil) {
            latestAccessToken = self.returnFacebookAccessToken()
            
            
            let tokenCheck = NSURL(string: "http://nectrpay.com")
            let tokenRequest = NSURLRequest(URL: tokenCheck!)
            
            NSURLConnection.sendAsynchronousRequest(tokenRequest, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                
                print("ASynchronous \(jsonResult)")
            })
            
            //self.performSegueWithIdentifier("loadApp", sender: self)
            
        }
    }
    
    func returnFacebookAccessToken() -> String {
        return FBSDKAccessToken.currentAccessToken().tokenString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Facebook Login
    
    func loadMainView() {
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            if FBSDKAccessToken.currentAccessToken().hasGranted("public_profile") {
                
                var friendsRequest = FBSDKGraphRequest(graphPath: "/me/friends", parameters: nil, HTTPMethod: "GET")
                
                friendsRequest.startWithCompletionHandler {(connection : FBSDKGraphRequestConnection!, result : AnyObject!, error: NSError!) -> Void in
                    
                    if error == nil {
                        var userFriendsList = result as! NSDictionary
                        var data : NSArray = userFriendsList.objectForKey("data") as! NSArray
                        
                        for var i = 1; i < data.count; i++ {
                            let valueFriends : NSDictionary = data[i] as! NSDictionary
                            let id = valueFriends.objectForKey("id") as! String
                            print("The value is \(id)")
                        }
                        
                        print(userFriendsList)
                        
                        var friends = userFriendsList.objectForKey("data") as! NSArray
                        print("Found \(friends.count) friends.")
                    }
                }
            }
        }
    }
    
    func loginViewFetchedUserInfo() {
    
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if (error == nil)
        {
            
            if (FBSDKAccessToken.currentAccessToken() != nil) {
                print("Login complete")
                /*
                FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, picture.type(large)"]).startWithCompletionHandler({(connection, result, error) -> Void in
                    if (error == nil) {
                        self.dict = result as! NSDictionary
                        print(result)
                        print(self.dict)
                    }
                
                })
                */
                /*
                var friendsRequest = FBSDKGraphRequest(graphPath: "/me/friends", parameters: nil)
                
                friendsRequest.startWithCompletionHandler {(connection : FBSDKGraphRequestConnection!, result : AnyObject!, error: NSError!) -> Void in
                    
                    if error == nil {
                        var userFriendsList = result as! NSDictionary
                        var data : NSArray = userFriendsList.objectForKey("data") as! NSArray
                        
                        for i in 0...data.count {
                            let valueFriends : NSDictionary = data[i] as! NSDictionary
                            let id = valueFriends.objectForKey("id") as! String
                            print("The value is \(id)")
                        }
                        
                        
                        var friends = userFriendsList.objectForKey("data") as! NSArray
                        print("Found \(friends.count) friends.")
                    }
                }
                */
                self.dismissViewControllerAnimated(true, completion: nil)
                //self.performSegueWithIdentifier("loadApp", sender: self)
            }
            else
            {
                print("Not logged In")
            }
            
        }
        else
        {
            print(error.localizedDescription)
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}