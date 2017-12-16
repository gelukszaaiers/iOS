//
//  SettingsViewController.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - ViewModel
    fileprivate let viewModel = SettingsViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var logoutView: UIView?
    @IBOutlet weak var logoutButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Setup
extension SettingsViewController {
    func setupView() {
        setupNavigationBar()
        setupTableView()
        setupLogoutView()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.gradientBackground()
        navigationController?.navigationBar.setupBar()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closePressed(_:)))
    }
    
    func setupTableView() {
        tableView?.register(UINib(nibName: SettingsTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.reuseIdentifier)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView(frame: .zero)
    }
    
    func setupLogoutView() {
        logoutView?.layer.borderWidth = 0.5
        logoutView?.layer.borderColor = UIColor.silver.cgColor
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as! SettingsTableViewCell
        if indexPath.row == 2 {
            cell.setupCell(withTitle: viewModel.data[indexPath.row], andDescription: "Niet geverifieerd ")
        } else {
            cell.setupCell(withTitle: viewModel.data[indexPath.row])
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "editProfile", sender: tableView)
            break
        default:
            break
        }
    }
}

// MARK: - Actions
extension SettingsViewController {
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func closePressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
