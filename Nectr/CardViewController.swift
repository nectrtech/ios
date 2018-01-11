//
//  CardViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-06-24.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardNameLabel: UILabel!
    
    var pool = Pool?()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pool = pool {
            
            cardNameLabel.text = pool.poolType
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
