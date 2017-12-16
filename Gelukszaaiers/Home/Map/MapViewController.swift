//
//  MapViewController.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var seedsLabel: UILabel!

    // MARK: - Internals

    private let viewModel = MapViewModel()

    // MARK: - View flow

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.updateSeeds = updateSeeds
        viewModel.fetch()
    }

    // MARK: - UI

    private func updateSeeds() {
        // Remove all the annotations.
        mapView.removeAnnotations(mapView.annotations)
        // Add seed annotations.
        mapView.addAnnotations(viewModel.annotations)
        // Update the seeds label.
        seedsLabel.text = viewModel.seedCountString
    }

}
