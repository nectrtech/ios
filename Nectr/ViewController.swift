//
//  ViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-05-26.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var btnDismiss: UIButton!
    @IBOutlet weak var poolIcon: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        textField.delegate = self

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        
        return true
    }
    
    @IBAction func logoutUser(sender: FBSDKLoginButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}