//
//  NotificationsTableViewCell.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-18.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {

    @IBOutlet var notificationsLabel: UILabel!
    
    @IBOutlet var datesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
