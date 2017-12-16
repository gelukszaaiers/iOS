//
//  EditProfileViewController.swift
//  Gelukszaaiers
//
//  Created by Dylan Gyesbreghs on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var pictureView: UIView?
    @IBOutlet weak var editPictureView: UIImageView?
    @IBOutlet weak var stackView: UIStackView?
    @IBOutlet weak var firstNameTextField: UITextField?
    @IBOutlet weak var surNameTextField: UITextField?
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var phoneNumberTextField: UITextField?
    @IBOutlet weak var deleteAccountButton: ColorRoundCornerButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Setup
extension EditProfileViewController {
    func setupView() {
        setupNavigationBar()
        setupPictureView()
        deleteAccountButton?.color = .mango
        stackView?.layer.borderWidth = 0.25
        stackView?.layer.borderColor = UIColor.silver.cgColor
    }
    
    func setupPictureView() {
        pictureView?.layer.masksToBounds = true
        pictureView?.layer.borderColor = UIColor.mango.cgColor
        pictureView?.layer.borderWidth = 1.5
        pictureView?.layer.cornerRadius = 53.5
    }
    
    func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "EditProfileSave"), style: .plain, target: self, action: #selector(savePressed(_:)))
    }
    
    func setupImageView(withImage image: UIImage) {
        editPictureView?.image = image
    }
}

// MARK: - Actions
extension EditProfileViewController {
    @IBAction func dismiss(_ sender: UIButton) {
        firstNameTextField?.resignFirstResponder()
        surNameTextField?.resignFirstResponder()
        emailTextField?.resignFirstResponder()
        phoneNumberTextField?.resignFirstResponder()
    }
    
    @IBAction func changePicturePressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "profileSaved", sender: sender)
    }
}

// MARK: - UIImagePickerControllerDelegate
extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage else { return }
        setupImageView(withImage: possibleImage)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
