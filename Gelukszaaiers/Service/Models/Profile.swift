//
//  Profile.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct Profile: Codable {

    struct Authentication: Codable {
        var accessToken: String?
        var refreshToken: String?
    }

    var id: String?
    var name: String?
    var email: String?
    var mobile: String?
    var verified: Bool?
    var avatar: URL?
    var langcode: String?
    var authentication: Authentication?

}
