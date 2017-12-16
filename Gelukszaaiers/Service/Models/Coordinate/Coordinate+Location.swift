//
//  Coordinate+Location.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation
import CoreLocation

extension Coordinate {
    var coordinate: CLLocationCoordinate2D? {
        guard
            let lat = lat,
            let lng = lng else { return nil }

        return CLLocationCoordinate2DMake(lat, lng)
    }
}
