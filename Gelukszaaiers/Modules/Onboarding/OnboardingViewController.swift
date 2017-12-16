//
//  OnboardingViewController.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - ViewModel
    fileprivate let viewModel = OnboardingViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var pageControl: UIPageControl?
    @IBOutlet weak var startButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateTranslations()
    }
}


// MARK: - Setup
extension OnboardingViewController {
    func setupView() {
        setupBackground()
        setupCollectionView()
    }
    
    func setupBackground() {
        let gradientLayer = CAGradientLayer(frame: view.bounds, colors: [.lightGold, .mango])
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupCollectionView() {
        collectionView?.register(UINib(nibName: OnboardingCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: OnboardingCollectionViewCell.reuseIdentifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
}

// MARK: - Translations
extension OnboardingViewController {
    func updateTranslations() {
        startButton?.setTitle(viewModel.startButtonTitle(forIndex: 0), for: .normal)
    }
}

// MARK: - UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.onboardingDescription.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.reuseIdentifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setupCell(Array(viewModel.onboardingDescription)[indexPath.row].key,
                       withDescription: Array(viewModel.onboardingDescription)[indexPath.row].value)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width,
                      height: collectionView.bounds.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl?.currentPage = currentIndex
        startButton?.setTitle(viewModel.startButtonTitle(forIndex: currentIndex), for: .normal)
    }
}
