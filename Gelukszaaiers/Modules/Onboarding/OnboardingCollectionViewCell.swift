//
//  OnboardingCollectionViewCell.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    func setupCell(_ title: String, withDescription description: String) {
        titleLabel?.text = title
        descriptionLabel?.text = description
    }
}
