//
//  Profile.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct Profile: Codable {
    var id: String?
    var name: String?
    var email: String?
    var mobile: String?
    var verified: Bool?
    var avatar: URL?
    var langcode: String?
    
    var authentication: Authentication?
    var seeds_owned: [Seed]?
    var seeds_visited: [Seed]?

}
