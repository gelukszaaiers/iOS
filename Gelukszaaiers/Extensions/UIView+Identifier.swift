//
//  UIView+Identifier.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

extension UIView {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
