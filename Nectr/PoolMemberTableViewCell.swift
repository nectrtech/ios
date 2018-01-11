//
//  PoolMemberTableViewCell.swift
//  Nectr
//
//  Created by James McNab on 2015-06-21.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class PoolMemberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var poolMemberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
