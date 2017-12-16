//
//  Seed.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct Seed: Codable {
    var id: String?
    var ownerId: String?
    var title: String?
    var description: String?
    var start: Date?
    var end: Date?
    var recurs: String?
    var likes: Int?

    var location: Location?
    var media: [Image]?
    var visitors: [Person]?
}
