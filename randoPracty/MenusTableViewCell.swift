//
//  MenusTableViewCell.swift
//  randoPracty
//
//  Created by Avery Bentz on 2015-08-10.
//  Copyright (c) 2015 Avery Bentz. All rights reserved.
//

import UIKit

class MenusTableViewCell: UITableViewCell {

    @IBOutlet var menusLabel: UILabel!
    
    @IBOutlet var menusImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
