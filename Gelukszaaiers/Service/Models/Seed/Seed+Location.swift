//
//  Seed+Location.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation
import MapKit

extension Seed {

    var annotation: MKAnnotation? {
        guard let coordinate = location?.coordinates?.coordinate else { return nil }

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        return annotation
    }

}
