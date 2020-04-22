//
//  IndiaTableViewCell.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 17/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit

class IndiaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var stateNames: UILabel!
    @IBOutlet weak var activeInStates: UILabel!
    @IBOutlet weak var recoveredInStates: UILabel!
    @IBOutlet weak var deathsInStates: UILabel!
    
//    var stateN = ""
//    var active = ""
//    var recovered = ""
//    var death = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
