//
//  ColorRoundCornerButton.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class ColorRoundCornerButton: RoundCornerButton {
    
    @IBInspectable var color: UIColor? {
        set {
            guard let value = newValue else { return }
            layer.borderColor = value.cgColor
            self.setTitleColor(value, for: .normal)
        }
        get {
            guard let borderColor = layer.borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        }
    }
    
    override func setupButton() {
        super.setupButton()
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
    
}
