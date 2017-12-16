//
//  SeedTableViewCell.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class SeedTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    // MARK: - Configure

    func configure(seed: Seed?) {
        titleLabel.text = seed?.title
        timeLabel.text = "Dagelijks, 9.00u tot 17.00u"
        locationLabel.text = seed?.location?.city
    }

}
