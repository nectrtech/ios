//
//  CreateViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-06-21.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var poolTypeIconImage: UIImageView!
    @IBOutlet weak var poolTitle: UITextField!
    
    @IBOutlet weak var addFunds: btnRound!
    @IBOutlet weak var addMembers: btnRound!
    @IBOutlet weak var savePool: btnRound!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Create"
        
        poolTitle.delegate = self
        
        maskPoolIcon()

    }
    
    func maskPoolIcon() {
        
        var maskingImage = UIImage(named: "polygon")!
        var maskingLayer = CALayer()
        maskingLayer.contentsGravity = kCAGravityResizeAspect
        maskingLayer.frame = poolTypeIconImage.bounds
        maskingLayer.contents = maskingImage.CGImage
        poolTypeIconImage.layer.mask = maskingLayer
        poolTypeIconImage.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        navigationItem.title = poolTitle.text
        poolTitle.text = poolTitle.text
        
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
