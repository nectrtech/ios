//
//  FriendsTableViewController.swift
//  Nectr
//
//  Created by James McNab on 2015-07-04.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit
import AddressBook

class FriendsTableViewController: UITableViewController {

    // Get Address book ref
    var addressBook: ABAddressBookRef = {
        var error: Unmanaged<CFError>?
        return ABAddressBookCreateWithOptions(nil, &error).takeRetainedValue() as ABAddressBookRef
        }()
    
    var userABFriendItems = [userABFriends]()
    var selectedFriends = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Who's Invited?"
        
        self.tableView.allowsMultipleSelection = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadFriends()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFriends() {
        
        switch ABAddressBookGetAuthorizationStatus() {
        case .Authorized:
            readFromAddressBook(addressBook)
            
        case .Denied:
            print("denied")
            self.cantInviteFriendsAlert()
        case .NotDetermined:
            ABAddressBookRequestAccessWithCompletion(addressBook, {[weak self] (granted: Bool, error: CFError!) in
                if granted {
                    let strongSelf = self!
                    strongSelf.readFromAddressBook(strongSelf.addressBook)
                } else {
                    print("access denied")
                    self!.cantInviteFriendsAlert()
                }
                })
        case .Restricted:
            print("restricted")
            self.cantInviteFriendsAlert()
        }
    }
    
    func readFromAddressBook(addressBook: ABAddressBookRef) {
        var allFriends = ABAddressBookCopyArrayOfAllPeople(addressBook).takeRetainedValue() as NSArray
        
        for friend: ABRecordRef in allFriends {
            
            var index = 0
            
            let userAvatarData = ABPersonCopyImageData(friend)?.takeUnretainedValue() as? NSData ?? NSData()
            
            let userAvatar = UIImage(data: userAvatarData)
            
            //let userAvatar = UIImage(named: "personal")
            
            let userFirstName = ABRecordCopyValue(friend, kABPersonFirstNameProperty)?.takeRetainedValue() as? String ?? ""
            let userLastName = ABRecordCopyValue(friend, kABPersonLastNameProperty)?.takeRetainedValue() as? String ?? ""
            
            var userPhoneNo = ABRecordCopyValue(friend, kABPersonPhoneProperty)?.takeRetainedValue() as! CFStringRef
            
            var userABFriendItem = [userABFriends(ABfriendFirstName: userFirstName, ABfriendLastName: userLastName, ABfriendPhoneNo: userPhoneNo, ABfriendPhoto: userAvatar)]
            
            userABFriendItems.append(userABFriendItem[index])
            
            index += 1
            
        }
    }
    
    func cantInviteFriendsAlert() {
        let cantInviteFriends = UIAlertController(title: "Can't Invite Friends", message: "You must give access to your contacts to invite friends", preferredStyle: .Alert)
        cantInviteFriends.addAction(UIAlertAction(title: "Add Contacts", style: .Default, handler: { action in self.openSettings()
        }))
        cantInviteFriends.addAction(UIAlertAction(title: "I'm a Loner", style: .Cancel, handler: nil))
        
        presentViewController(cantInviteFriends, animated: true, completion: nil)
    }
    
    func openSettings() {
        let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString)
        UIApplication.sharedApplication().openURL(settingsURL!)
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return userABFriendItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "FriendsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! FriendsTableViewCell

        let userABFriendListItem = userABFriendItems[indexPath.row]

        var fName = userABFriendListItem.ABfriendFirstName
        var lName = userABFriendListItem.ABfriendLastName
        //cell.friendUserName.text = fName! + " " + lName!
        cell.friendUserName.text = fName!
        cell.userABPhotoThumb.image = userABFriendListItem.ABfriendPhoto
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var selectedRow: Int = indexPath.row
        
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! FriendsTableViewCell
        
        selectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! FriendsTableViewCell
        
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

}
