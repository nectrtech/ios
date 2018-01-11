//
//  PoolMemberTableViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-06-21.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class PoolMemberTableViewController: UITableViewController {

    var pools = [Pool]()
    var poolMemberList = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pool Mates"

        var pool1 = Pool(poolTitle: "OVOFest", poolType: "Event", poolFunds: "80.00", poolMembers: [["name":"James", "funds":"80.00"],["name":"Dave", "funds":"80.00"],["name":"Jan", "funds":"80.00"]], poolSettings: ["":""])!
        
        pools += [pool1]
        /*
        for (index, name) in enumerate(pool1.poolMembers) {
            poolMemberList.append(name["name"])
            
        }
        */
        
        //let userResult = result as? NSDictionary
        //self.userName.text = userResult?["name"] as? String
        
        //loadPool()
    }
    
    func loadPool() {
        var pool1 = Pool(poolTitle: "OVOFest", poolType: "Event", poolFunds: "240.00", poolMembers: [["name":"James", "funds":"80.00"],["name":"Dave", "funds":"80.00"],["name":"Jan", "funds":"80.00"]], poolSettings: ["":""])!
        
        pools = [pool1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return poolMemberList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellID = "PoolMemberTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! PoolMemberTableViewCell
        
        let PoolMember = poolMemberList[indexPath.row]
        cell.poolMemberName?.text = PoolMember
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "viewMember" {
            
            let memberDetailVC = segue.destinationViewController as! PoolMemberViewController
            
            if let selectedMemberCell = sender as? PoolMemberTableViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedMemberCell)!
                let selectedMember = pools[indexPath.row]
                memberDetailVC.pool = selectedMember
                
            }
        }
    }
}
