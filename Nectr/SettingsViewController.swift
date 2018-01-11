//
//  SettingsViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-07-08.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SettingsViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, FBSDKLoginButtonDelegate {

    @IBOutlet weak var CurrencyTitleView: UITableView!
    
    @IBOutlet weak var emailSetting: UITextField!
    @IBOutlet weak var pinSetting: UITextField!
    
    @IBOutlet weak var fbLoginBtn: FBSDKLoginButton!
    
    var currencyItem = ["Currency"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CurrencyTitleView.delegate = self
        self.CurrencyTitleView.dataSource = self
        emailSetting.delegate = self
        pinSetting.delegate = self
        
        self.navigationItem.title = "Account Settings"

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyItem.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "CurrencyCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as! UITableViewCell!
        cell.textLabel?.text = self.currencyItem[indexPath.row]
        
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        
        return true
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("test")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
/*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
*/
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
