//
//  FirstCell.swift
//  SegmentedControl3APIs
//
//  Created by Vignesh on 03/01/19.
//  Copyright © 2019 Vignesh. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell {

    // Outlet
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
