//
//  AddSeedViewController.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit
import SwiftyFORM

class AddSeedViewController: FormViewController {

    // MARK: - View flow

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Nieuw aanbod"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop,
                                                           target: self,
                                                           action: #selector(close(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                           target: self,
                                                           action: #selector(save(_:)))
    }

    // MARK: - Actions

    @IBAction func close(_ sender: AnyObject) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: AnyObject) {
        print(#function)
    }

}
