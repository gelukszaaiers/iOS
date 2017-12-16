//
//  Result.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

struct Result<T: Codable>: Codable {

    struct Metadata: Codable {
        var count: Int?
        var totalCount: Int?
    }

    var meta: Metadata?
    var data: T

}
