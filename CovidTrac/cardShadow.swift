//
//  cardShadow.swift
//  NewsApp
//
//  Created by RUPAM LAHA on 21/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit

class cardShadow: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundShadow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundShadow()
    }
    
    func backgroundShadow() {
    
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        
    }
    
}
