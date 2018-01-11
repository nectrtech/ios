//
//  PoolTableViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-06-21.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class PoolTableViewController: UITableViewController {

    // MARK: Properties
    
    var pools = [Pool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Your Pools"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        var jsonError: NSError?
//        let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as NSDictionary
//        
//        if let unwrappedError = jsonError {
//            println("json error: \(unwrappedError)")
//        } else {
//            self.titles = json.valueForKeyPath("feed.entry.im:name.label") as [String]
//        }
        
        loadPools()
    }
    
    func loadPools() {
        
        let pool1 = Pool(poolTitle: "OVOFest2015!!!!", poolType: "Event", poolFunds: "565.44", poolMembers: [["name":"James", "funds":"75.44"], ["name":"James", "funds":"75.44"]], poolSettings: ["DateCreated":"August 19th, 2015"])!
        
        let pool2 = Pool(poolTitle: "Rent Rent Rent", poolType: "Rent", poolFunds: "4,000.00", poolMembers: [["name":"James", "funds":"1000.00"], ["name":"Sarah", "funds":"1000.00"], ["name":"Benjamin", "funds":"1000.00"], ["name":"Felicity", "funds":"1000.00"]], poolSettings: ["":""])!
        
        let pool3 = Pool(poolTitle: "Beerun", poolType: "Group Buy", poolFunds: "80.00", poolMembers: [["name":"James", "funds":"20.00"], ["name":"Edward", "funds":"20.00"], ["name":"Jan", "funds":"20.00"], ["name":"Dave", "funds":"20.00"]], poolSettings: ["":""])!
        
        let pool4 = Pool(poolTitle: "Supercar Speedway", poolType: "Group Buy", poolFunds: "800.00", poolMembers: [["name":"James", "funds":"200.00"], ["name":"Dave", "funds":"200.00"], ["name":"Jan", "funds":"200.00"], ["name":"Edward", "funds":"200.00"]], poolSettings: ["":""])!
        
        let pool5 = Pool(poolTitle: "Viva Las Vegas", poolType: "Trip", poolFunds: "2000.00", poolMembers: [["name":"James", "funds":"500.00"], ["name":"Dave", "funds":"500.00"], ["name":"Jan", "funds":"500.00"], ["name":"Edward", "funds":"500.00"]], poolSettings: ["":""])!
        
        pools += [pool1, pool2, pool3, pool4, pool5]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return pools.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "PoolTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! PoolTableViewCell
        
        let pool = pools[indexPath.row]
        cell.poolTitle.text = pool.poolTitle

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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "showPool" {
        
            let poolDetailVC = segue.destinationViewController as! PoolViewController
        
            if let selectedPoolCell = sender as? PoolTableViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedPoolCell)!
                let selectedPool = pools[indexPath.row]
                poolDetailVC.pool = selectedPool
            
            }
            
        }
    }

}
