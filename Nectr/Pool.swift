//
//  Pool.swift
//  Nectr
//
//  Created by James McNab on 2015-06-21.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class UserProfileData {
    
    // MARK: Properties
    
    var userProfileName: String?
    var userProfileImage: UIImage?
    
    init?(userProfileName: String?, userProfileImage: UIImage?) {
        self.userProfileName = userProfileName
        self.userProfileImage = userProfileImage
    }
}

class Pool {
    
    // MARK: Properties
    
    var poolTitle: String?
    let poolType: String?
    var poolFunds: String?
    var poolMembers: [[String:String]]
    var poolSettings: NSDictionary
    
    init?(poolTitle: String?, poolType: String?, poolFunds: String?, poolMembers: [[String:String]], poolSettings: NSDictionary) {
        self.poolTitle = poolTitle
        self.poolType = poolType
        self.poolFunds = poolFunds
        self.poolMembers = poolMembers
        self.poolSettings = poolSettings
    
        //Initialization fail
        
        if (poolTitle!.isEmpty || poolType!.isEmpty) {
            return nil
        }
    }
}

class PoolType {
    
    // MARK: Properties
    
    var poolIconImage: UIImage?
    var poolTypeTitle: String?
    
    
    init(poolIconImage: UIImage?, poolTypeTitle: String?) {
        self.poolIconImage = poolIconImage
        self.poolTypeTitle = poolTypeTitle
        
    }
    
}

class userABFriends {
    
    // MARK: Properties
    
    var ABfriendFirstName: String?
    var ABfriendLastName: String?
    var ABfriendPhoneNo: CFStringRef
    var ABfriendPhoto: UIImage?
    
    
    init(ABfriendFirstName: String?, ABfriendLastName: String?, ABfriendPhoneNo: CFStringRef, ABfriendPhoto: UIImage?) {
        self.ABfriendFirstName = ABfriendFirstName
        self.ABfriendLastName = ABfriendLastName
        self.ABfriendPhoneNo = ABfriendPhoneNo
        self.ABfriendPhoto = ABfriendPhoto
    }
    
}

class userFBFriends {
    
    // MARK: Properties
    
    var fbFriendUserName: String?
    var fbFriendsUserImage: UIImage?
    
    init(fbFriendUserName: String?, fbFriendsUserImage: UIImage?) {
        self.fbFriendUserName = fbFriendUserName
        self.fbFriendsUserImage = fbFriendsUserImage
    }
}

class CurrencyType {
    
    // MARK: Properties
    
    var currencyIconImage: UIImage?
    var currencyTypeTitle: String?
    
    
    init(currencyIconImage: UIImage?, currencyTypeTitle: String?) {
        self.currencyIconImage = currencyIconImage
        self.currencyTypeTitle = currencyTypeTitle
        
    }
    
}

class User {

    // MARK: Properties
    
    var userName: String?
    var fName: String?
    var lName: String?
    var userFunds: String?
    var userFriends: NSDictionary
    var userPools: NSDictionary
    var userDOB: String?
    var userHome: String?
    var userCards: [[String:String]]
    var userSettings: NSDictionary
    
    init(userName: String?, fName: String?, lName: String?, userFunds: String?, userFriends: NSDictionary, userPools: NSDictionary, userDOB: String?, userHome: String?, userCards: [[String:String]], userSettings: NSDictionary) {
        self.userName = userName
        self.fName = fName
        self.lName = lName
        self.userFunds = userFunds
        self.userFriends = userFriends
        self.userPools = userPools
        self.userDOB = userDOB
        self.userHome = userHome
        self.userCards = userCards
        self.userSettings = userSettings
    }
    
}
