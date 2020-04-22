//
//  NavBanner.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 16/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit

class NavBanner: UINavigationItem {
    
    private let fixedImage : UIImage = UIImage(named: "CovidTracBanner.png")!
    private let imageView : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 8))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        imageView.contentMode = .scaleAspectFit
        imageView.image = fixedImage
        self.titleView = imageView

    }

}
