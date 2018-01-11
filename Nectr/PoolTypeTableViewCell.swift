//
//  PoolTypeTableViewCell.swift
//  Nectr
//
//  Created by James McNab on 2015-07-01.
//  Copyright (c) 2015 James McNab. All rights reserved.
//

import UIKit

class PoolTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var poolTypeLabel: UILabel!
    @IBOutlet weak var poolTypeIconImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
