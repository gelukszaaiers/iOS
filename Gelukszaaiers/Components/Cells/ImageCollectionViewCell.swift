//
//  ImageCollectionViewCell.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Configure

    func configure(image: UIImage) {
        imageView.image = image
    }
    
}
