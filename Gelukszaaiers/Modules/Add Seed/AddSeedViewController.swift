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
        print(#function, titleField.value)
        print(#function, descriptionField.value)
        print(#function, beginDateField.value)
        print(#function, endDateField.value)
    }

    // MARK: - Form

    override func populate(_ builder: FormBuilder) {
        builder += titleField
        builder += SectionFormItem()
        builder += descriptionField
        builder += SectionFormItem()
        populateImages(builder)
        builder += SectionFormItem()
        builder += beginDateField
        builder += endDateField
    }

    private func populateImages(_ builder: FormBuilder) {
        guard images.count > 0 else {
            builder += addImageButton
            return
        }

        let imagesFormItem = CustomFormItem()
        imagesFormItem.createCell = { [unowned self] _ in
            let cell = try ImagesTableViewCell.createCell()
            cell.configure(images: self.images) {
                self.showImagePicker()
            }
            return cell
        }
        builder += imagesFormItem
    }

    // MARK: Fields

    private lazy var titleField: TextFieldFormItem = {
        let field = TextFieldFormItem()
        field.title("Titel").placeholder("Your seed")
        field.keyboardType = .asciiCapable
        field.autocorrectionType = .no
        field.submitValidate(CountSpecification.min(1), message: "Should have a correct value")
        return field
    }()

    private lazy var descriptionField: TextViewFormItem = {
        let field = TextViewFormItem()
        field.title("Korte omschrijving van het aanbod").placeholder("Some description")
        return field
    }()

    // MARK: Images

    private lazy var beginDateField: DatePickerFormItem = {
        let field = DatePickerFormItem()
        field.title = "Begin"
        field.datePickerMode = .dateAndTime
        return field
    }()

    private lazy var endDateField: DatePickerFormItem = {
        let field = DatePickerFormItem()
        field.title = "Einde"
        field.datePickerMode = .dateAndTime
        return field
    }()

    // MARK: Images

    private var images: [UIImage] = []

    private lazy var addImageButton: ButtonFormItem = { [unowned self] in
        let button = ButtonFormItem()
        button.title = "Voeg afbeelding toe (optioneel)"
        button.action = self.showImagePicker
        return button
    }()

    private func showImagePicker() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

}

extension AddSeedViewController: UINavigationControllerDelegate {
}

extension AddSeedViewController: UIImagePickerControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            images.append(image)
            reloadForm()
        }
        dismiss(animated: true, completion: nil)
    }

}
