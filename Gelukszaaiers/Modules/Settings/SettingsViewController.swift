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
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.gradientBackground()
        navigationController?.navigationBar.tintColor = .white
    }
    
    func setupTableView() {
        tableView?.register(UINib(nibName: SettingsTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.reuseIdentifier)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath)
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected: \(indexPath.row)")
    }
}
