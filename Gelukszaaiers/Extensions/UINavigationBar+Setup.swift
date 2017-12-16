//
//  UINavigationBar+GradientLayer.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func gradientBackground(withColor colors: [UIColor] = [.lightGold, .mango]) {
        var updatedFrame = bounds
        updatedFrame.size.height += 20
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        setBackgroundImage(gradientLayer.gradientImage, for: UIBarMetrics.default)
    }
    
    func clear() {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
    
    func setupBar() {
        tintColor = UIColor.white
        titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
}
