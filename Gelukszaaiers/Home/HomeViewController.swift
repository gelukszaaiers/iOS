//
//  HomeViewController.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Internals

    private let viewModel = HomeViewModel()
    private lazy var mapViewController: MapViewController = { [unowned self] in
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "Map") as! MapViewController
        controller.delegate = self
        return controller
    }()

    // MARK: - View flow

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.updateProfile = updateProfile
        viewModel.fetch()
    }

    // MARK: - UI

    private func updateProfile() {
        tableView.reloadData()
    }

    // MARK: - Actions

    @IBAction func addNewSeed(_ sender: AnyObject) {
        let controller = AddSeedViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        present(navigationController, animated: true, completion: nil)
    }

}

extension HomeViewController: MapViewControllerDelegate {

    func mapViewControllerDidToggleType(_ controller: MapViewController) {
        viewModel.toggleSeedType()
    }

}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.seedCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SeedTableViewCell
        cell.configure(seed: viewModel[indexPath])
        return cell
    }

}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.bounds.height / 2.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return mapViewController.view
    }

}
