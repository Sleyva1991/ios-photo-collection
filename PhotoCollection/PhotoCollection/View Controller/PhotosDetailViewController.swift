//
//  PhotosDetailViewController.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotosDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        if themePreference == "Dark" {
            view.backgroundColor = .darkGray
        } else if themePreference == "Grey" {
            view.backgroundColor = .gray
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        nameTextField.text = photo.title
       
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        imagePicker.delegate = self
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImageView.image = pickedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = nameTextField.text, !title.isEmpty,
        let image = photoImageView.image,
        let imageData = image.pngData() else { return }
        if let photo = photo {
            photoController?.update(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.create(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
        
    }
}
