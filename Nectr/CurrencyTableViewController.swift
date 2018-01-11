//
//  CurrencyTableViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-07-08.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class CurrencyTableViewController: UITableViewController {

    var currencyTypes = [CurrencyType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        
        let currencyType1 = CurrencyType(currencyIconImage: artshow_icon, currencyTypeTitle: "Artshow")
        let currencyType2 = CurrencyType(currencyIconImage: couple_icon, currencyTypeTitle: "Couple")
        let currencyType3 = CurrencyType(currencyIconImage: crowdfunding_icon, currencyTypeTitle: "Crowdfunding")
        let currencyType4 = CurrencyType(currencyIconImage: groupbuy_icon, currencyTypeTitle: "Groupbuy")
        let currencyType5 = CurrencyType(currencyIconImage: liveshow_icon, currencyTypeTitle: "Live Show")
        let currencyType6 = CurrencyType(currencyIconImage: lottery_icon, currencyTypeTitle: "Lottery")
        let currencyType7 = CurrencyType(currencyIconImage: personal_icon, currencyTypeTitle: "Personal")
        let currencyType8 = CurrencyType(currencyIconImage: prize_icon, currencyTypeTitle: "Prize")
        let currencyType9 = CurrencyType(currencyIconImage: rent_icon, currencyTypeTitle: "Rent")
        let currencyType10 = CurrencyType(currencyIconImage: trip_icon, currencyTypeTitle: "Trip")
        
        currencyTypes += [currencyType1, currencyType2, currencyType3, currencyType4, currencyType5, currencyType6, currencyType7, currencyType8, currencyType9, currencyType10]
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
        
        return currencyTypes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "CurrencyTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! CurrencyTableViewCell

        let currencyType = currencyTypes[indexPath.row]
        cell.currencyItemLabel.text = currencyType.currencyTypeTitle

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        if selectedCell.accessoryType == UITableViewCellAccessoryType.None {
            selectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        if selectedCell.accessoryType == UITableViewCellAccessoryType.Checkmark {
            selectedCell.accessoryType = UITableViewCellAccessoryType.None
        }
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
