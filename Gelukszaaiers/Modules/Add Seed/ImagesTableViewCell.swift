//
//  ImagesTableViewCell.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit
import SwiftyFORM

class ImagesTableViewCell: UITableViewCell, CellHeightProvider {

    // MARK: - Outlets

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let imageNib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
            collectionView.register(imageNib, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        }
    }

    // MARK: - Handlers

    private var addImage: (() -> Void)?

    // MARK: - Internals

    private var images: [UIImage] = []

    // MARK: - Form

    static func createCell() throws -> ImagesTableViewCell {
        return try Bundle.main.form_loadView("ImagesTableViewCell")
    }

    func form_cellHeight(indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return collectionView.collectionViewLayout.collectionViewContentSize.height
    }

    // MARK: - Configure

    func configure(images: [UIImage], addImage: @escaping () -> Void) {
        self.images = images
        self.addImage = addImage
        collectionView.reloadData()
    }

}

extension ImagesTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = bounds.width / 5
        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item == 0 else { return }
        addImage?()
    }

}

extension ImagesTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        if indexPath.item == 0 {
            cell.configure(image: #imageLiteral(resourceName: "Add"))
        } else {
            cell.configure(image: images[indexPath.item - 1])
        }
        return cell
    }

}
