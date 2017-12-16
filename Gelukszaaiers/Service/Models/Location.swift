//
//  Location.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct Location: Codable {
    var address: String?
    var postalcode: Int?
    var city: String?
    var country: String?
    var coordinates: Coordinate?
}
