//
//  GradientCornerButton.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class GradientCornerButton: RoundCornerButton {

    override func setupButton() {
        super.setupButton()
        
        let gradientLayer = CAGradientLayer(frame: bounds, colors: [.booger, .leaf])
        layer.insertSublayer(gradientLayer, at: 0)
    }

}
