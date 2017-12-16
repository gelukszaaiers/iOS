//
//  LocationTableViewCell.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit
import SwiftyFORM
import LocationPickerViewController

class LocationTableViewCell: UITableViewCell, CellHeightProvider {

    // MARK: - Outlets

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

    // MARK: - Form

    static func createCell() throws -> LocationTableViewCell {
        return try Bundle.main.form_loadView("LocationTableViewCell")
    }

    func form_cellHeight(indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return 66.0
    }

    // MARK: - Configure

    func configure(location: LocationItem?) {
        let addressDictionary = location?.addressDictionary
        addressLabel.text = addressDictionary?["Street"] as? String

        let cityComponents = [
            addressDictionary?["City"] as? String,
            addressDictionary?["Country"] as? String
        ].flatMap { $0 }
        cityLabel.text = cityComponents.joined(separator: ",")
    }
    
}
