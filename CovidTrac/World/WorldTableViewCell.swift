//
//  WorldTableViewCell.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 17/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit

class WorldTableViewCell: UITableViewCell {

    @IBOutlet weak var countrieNames: UILabel!
    @IBOutlet weak var activeCasesCountries: UILabel!
    @IBOutlet weak var recoveredCountries: UILabel!
    @IBOutlet weak var deathsCountries: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
