//
//  MapViewModel.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class MapViewModel {

    // MARK: - Internals

    private let service: Service

    // MARK: - Handlers

    var updateSeeds: (() -> ())?

    // MARK: - Init

    init(service: Service = Service.shared) {
        self.service = service
    }

    // MARK: - Seeds

    private(set) var seeds: [Seed] = [] {
        didSet {
            updateSeeds?()
        }
    }

    var annotations: [MKAnnotation] {
        return seeds.flatMap { $0.annotation }
    }

    // MARK: - Request

    func fetch() {
        let request = SeedsRequest(filter: .proximity)
        let serializer = JSONSerializer<[Seed]>()
        Service.shared.execute(request, with: serializer) {
            switch serializer.response {
            case .success(let result):
                self.seeds = result.data
            case .failure(let error):
                print("💥", error)
            }
        }
    }

}
