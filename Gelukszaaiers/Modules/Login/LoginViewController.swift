//
//  LoginViewController.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {

    // MARK: - ViewModel
    fileprivate let viewModel = LoginViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var facebookButton: UIButton?
    @IBOutlet weak var registerButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateTranslations()
    }
}

// MARK: - Setup
extension LoginViewController {
    func setupView() {
        setupBackground()
        setupNavigationBar()
    }
    
    func setupBackground() {
        let gradientLayer = CAGradientLayer(frame: view.bounds, colors: [.lightGold, .mango])
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Info"), style: .done, target: self, action: #selector(infoButtonPressed(_:)))
    }
}

// MARK: - Translations
extension LoginViewController {
    func updateTranslations() {
        facebookButton?.setTitle(viewModel.facebookButtonTitle, for: .normal)
        registerButton?.setTitle(viewModel.registerButtonTitle, for: .normal)
    }
}

// MARK: - Actions
extension LoginViewController {
    @IBAction func infoButtonPressed(_ sender: UIBarButtonItem) {
        let viewController = SFSafariViewController(url: ApplicationKeys.shared.website)
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
}

// MARK: - SFSafariViewControllerDelegate
extension LoginViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
