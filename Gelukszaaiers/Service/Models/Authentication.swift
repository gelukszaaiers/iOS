//
//  Authentication.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct Authentication: Codable {
    var accessToken: String?
    var refreshToken: String?
}
