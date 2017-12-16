//
//  StartViewController.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import SafariServices

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
        updateTranslations()
    }
}

// MARK: - Setup
extension StartViewController {
    func setupView() {
        setupBackground()
        setupNavigationBar()
    }
    
    func setupBackground() {
        let gradientLayer = CAGradientLayer(frame: view.bounds, colors: [.lightGold, .mango])
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.clear()
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Info"), style: .done, target: self, action: #selector(infoButtonPressed(_:)))
    }
}

// MARK: - Translations
extension StartViewController {
    func updateTranslations() {
        titleLabel?.text = viewModel.titleLabel
        hapinessOfferButton?.setTitle(viewModel.hapinessOfferButtonTitle, for: .normal)
        loginButton?.setTitle(viewModel.loginButtonTitle, for: .normal)
        registerButton?.setTitle(viewModel.registerButtonTitle, for: .normal)
    }
}

// MARK: - Actions
extension StartViewController {
    @IBAction func infoButtonPressed(_ sender: UIBarButtonItem) {
        let viewController = SFSafariViewController(url: ApplicationKeys.shared.website)
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
}

// MARK: - SFSafariViewControllerDelegate
extension StartViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
