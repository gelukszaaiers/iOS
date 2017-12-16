//
//  EditProfileSuccessfullViewController.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class EditProfileSuccessfullViewController: UIViewController {

    // MARK: - ViewModel
    fileprivate let viewModel = EditProfileSuccessfullViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var closeButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTranslations()
    }
}

// MARK: - Translations
extension EditProfileSuccessfullViewController {
    func updateTranslations() {
        descriptionLabel?.text = viewModel.descriptionLabel
        closeButton?.setTitle(viewModel.closeButtonTitle, for: .normal)
    }
}

// MARK: - Actions
extension EditProfileSuccessfullViewController {
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
