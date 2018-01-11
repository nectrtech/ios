//
//  PoolViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-06-21.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class PoolViewController: UIViewController {

    @IBOutlet weak var poolTitleLabel: UILabel!
    @IBOutlet weak var poolFundsLabel: UILabel!
    
    @IBOutlet weak var addFundsBtn: btnRound!
    @IBOutlet weak var viewMembersBtn: btnRound!
    @IBOutlet weak var poolSettingsBtn: btnRound!
    
    @IBOutlet weak var poolTypeIconImage: UIImageView!
    
    // MARK: Properties
    
    var pool = Pool?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pool = pool {
            poolTitleLabel.text = pool.poolTitle
            poolFundsLabel.text = pool.poolFunds
        }

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
    
    

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
