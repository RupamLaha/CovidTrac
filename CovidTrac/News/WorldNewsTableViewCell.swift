//
//  WorldNewsTableViewCell.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 22/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit

class WorldNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descripNews: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
