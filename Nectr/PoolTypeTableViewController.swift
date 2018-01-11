//
//  PoolTypeTableViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-07-01.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class PoolTypeTableViewController: UITableViewController {

    var poolTypes = [PoolType]()
    var poolTypeList = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "What's the Pool for?"

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let artshow_icon = UIImage(named: "artshow")!
        let couple_icon = UIImage(named: "couple")!
        let crowdfunding_icon = UIImage(named: "crowdfunding")!
        let groupbuy_icon = UIImage(named: "groupbuy")!
        let liveshow_icon = UIImage(named: "liveshow")!
        let lottery_icon = UIImage(named: "lottery")!
        let personal_icon = UIImage(named: "personal")!
        let prize_icon = UIImage(named: "prize")!
        let rent_icon = UIImage(named: "rent")!
        let trip_icon = UIImage(named: "trip")!
        
        poolTypeList = ["artshow", "couple", "crowdfunding", "groupbuy", "liveshow", "lottery", "personal", "prize", "rent", "trip"]
        
        let poolTypeArtshow = PoolType(poolIconImage: artshow_icon, poolTypeTitle: "Artshow")
        let poolTypeCouple = PoolType(poolIconImage: couple_icon, poolTypeTitle: "Couple")
        let poolTypeCrowd = PoolType(poolIconImage: crowdfunding_icon, poolTypeTitle: "Crowdfunding")
        let poolTypeGroupbuy = PoolType(poolIconImage: groupbuy_icon, poolTypeTitle: "Groupbuy")
        let poolTypeLive = PoolType(poolIconImage: liveshow_icon, poolTypeTitle: "Live Show")
        let poolTypeLottery = PoolType(poolIconImage: lottery_icon, poolTypeTitle: "Lottery")
        let poolTypePersonal = PoolType(poolIconImage: personal_icon, poolTypeTitle: "Personal")
        let poolTypePrize = PoolType(poolIconImage: prize_icon, poolTypeTitle: "Prize")
        let poolTypeRent = PoolType(poolIconImage: rent_icon, poolTypeTitle: "Rent")
        let poolTypeTrip = PoolType(poolIconImage: trip_icon, poolTypeTitle: "Trip")
        
        
        
        poolTypes += [poolTypeArtshow, poolTypeCouple, poolTypeCrowd, poolTypeGroupbuy, poolTypeLive, poolTypeLottery, poolTypePersonal, poolTypePrize, poolTypeRent, poolTypeTrip]
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

        return poolTypes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "PoolTypeTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! PoolTypeTableViewCell
        
        let poolType = poolTypes[indexPath.row]
        cell.poolTypeLabel.text = poolType.poolTypeTitle
        cell.poolTypeIconImage.image = poolType.poolIconImage

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        
        selectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        
        selectedCell.accessoryType = UITableViewCellAccessoryType.None
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    }
    

}
