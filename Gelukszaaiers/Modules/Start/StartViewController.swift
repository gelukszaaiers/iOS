//
//  StartViewController.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - ViewModel
    fileprivate let viewModel = StartViewModel()
   
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var hapinessOfferButton: UIButton?
    @IBOutlet weak var loginButton: UIButton?
    @IBOutlet weak var registerButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Setup
extension StartViewController {
    func setupView() {
        setupBackground()
    }
    
    func setupBackground() {
        let gradientLayer = CAGradientLayer(frame: view.bounds, colors: [.lightGold, .mango])
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
