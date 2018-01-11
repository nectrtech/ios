//
//  FriendsTableViewCell.swift
//  Nectr
//
//  Created by James McNab on 2015-07-10.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendUserName: UILabel!
    @IBOutlet weak var userABPhotoThumb: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
