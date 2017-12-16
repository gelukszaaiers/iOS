//
//  MapViewController.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MapViewControllerDelegate: class {
    func mapViewControllerDidToggleType(_ controller: MapViewController)
}

class MapViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var seedsLabel: UILabel!

    // MARK: - Delegate

    weak var delegate: MapViewControllerDelegate?

    // MARK: - Internals

    private lazy var viewModel: MapViewModel = { [unowned self] in
        let viewModel = MapViewModel()
        viewModel.updateSeeds = self.updateSeeds
        viewModel.updateRegion = self.updateRegion
        return viewModel
    }()

    // MARK: - View flow

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetch()
    }

    // MARK: - Actions

    @IBAction func toggleSeeds(_ sender: Any) {
        delegate?.mapViewControllerDidToggleType(self)
    }

    // MARK: - UI

    private func updateRegion(_ region: MKCoordinateRegion) {
        mapView.setRegion(region, animated: false)
    }

    private func updateSeeds() {
        // Remove all the annotations.
        mapView.removeAnnotations(mapView.annotations)
        // Add seed annotations.
        mapView.addAnnotations(viewModel.annotations)
        // Update the seeds label.
        seedsLabel.text = viewModel.seedCountString
    }

}
