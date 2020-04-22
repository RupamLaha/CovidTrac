//
//  StateDetailsTableViewCell.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 17/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit

class StateDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var districsNames: UILabel!
    @IBOutlet weak var activeInDistrics: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
