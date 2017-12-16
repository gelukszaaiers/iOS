//
//  ApplicationKeys.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct ApplicationKeys {
    static var shared = ApplicationKeys()
    
    var website: URL {
        return URL(string: "http://www.gelukszaaiers.be")!
    }
    
}
