//
//  Person.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct Person: Codable {
    var id: String?
    var name: String?
    var email: String?
    var mobile: String?
    var avatar: URL?
    var langcode: String?
}
