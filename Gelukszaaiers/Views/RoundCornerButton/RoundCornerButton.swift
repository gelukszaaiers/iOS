//
//  RoundCornerButton.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class RoundCornerButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    func setupButton() {
        layer.masksToBounds = true
        layer.cornerRadius = 8
        
        setTitleColor(.white, for: .normal)
    }

}
