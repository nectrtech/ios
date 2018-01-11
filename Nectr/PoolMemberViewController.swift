//
//  PoolMemberViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-06-24.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class PoolMemberViewController: UIViewController {
    
    @IBOutlet weak var poolMemberNameLabel: UILabel!

    var pool = Pool?()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pool = pool {
            //var poolMemberList = pool.poolMembers[0] as String!
            //poolMemberNameLabel.text = poolMemberList
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
