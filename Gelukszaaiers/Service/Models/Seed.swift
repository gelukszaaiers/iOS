//
//  Seed.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct Seed: Codable {

    struct Image: Codable {
        var name: String?
        var url: URL?
    }

    struct Coordinate: Codable {
        var lat: Double?
        var lng: Double?
    }

    struct Location: Codable {
        var address: String?
        var postalcode: Int?
        var city: String?
        var country: String?
        var coordinates: Coordinate?
    }

    struct Visitor: Codable {
        var id: String?
        var name: String?
        var email: String?
        var mobile: String?
        var avatar: URL?
        var langcode: String?
    }

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
    var visitors: [Visitor]?

}
