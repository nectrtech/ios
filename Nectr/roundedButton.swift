//
//  roundedButton.swift
//  Nectr
//
//  Created by James McNab on 2015-06-01.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit
import FBSDKLoginKit

@IBDesignable class btnRound: UIButton {
    
    override func drawRect(rect: CGRect) {

        self.layer.cornerRadius = self.frame.size.width/10.75
        self.layer.masksToBounds = true
    }

}

@IBDesignable class btnLoginFB: FBSDKLoginButton {
    override func drawRect(rect: CGRect) {
        self.layer.masksToBounds = true
    }
}

@IBDesignable class fbProfilePicture: FBSDKProfilePictureView {
    override func drawRect(rect: CGRect) {
        
        
    }
}