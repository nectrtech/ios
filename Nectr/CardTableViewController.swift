//
//  CardTableViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-06-23.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController {
    
    var userCardList = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Your Cards"

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadCards()
    }
    
    func loadCards() {
        
        userCardList = ["Scotiabank Visa Debit", "Scotiabank Visa Frequent Flyer", "Nectr Supercharge", "Nectr Recharge"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return userCardList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CardTableViewCell", forIndexPath: indexPath) as! CardTableViewCell
        
        let card = userCardList[indexPath.row]
        cell.cardNameTitle.text = card

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
        
        if segue.identifier == "viewCard" {
            
            let cardDetailVC = segue.destinationViewController as! CardViewController
            
            if let selectedCardCell = sender as? CardTableViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedCardCell)!
                let selectedCard = userCardList[indexPath.row]
                //cardDetailVC.user = selectedCard
                
            }
            
        }
    }
    

}
