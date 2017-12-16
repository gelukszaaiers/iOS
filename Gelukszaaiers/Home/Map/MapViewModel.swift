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

class MapViewModel: NSObject {

    // MARK: - Internals

    private let service: Service
    private let locationManager = CLLocationManager()

    // MARK: - Handlers

    var updateSeeds: (() -> ())?
    var updateRegion: ((_ region: MKCoordinateRegion) -> ())?

    // MARK: - Init

    init(service: Service = Service.shared) {
        self.service = service
        super.init()

        // Request current location.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    // MARK: - Text

    var seedCountString: String {
        return "\(seeds.count) Actieve gelukszaadjes"
    }

    // MARK: - Seeds

    private var seeds: [Seed] = [] {
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

extension MapViewModel: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard
            let coordinate = manager.location?.coordinate,
            status == .authorizedWhenInUse else { return }

        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        updateRegion?(region)
    }

}
