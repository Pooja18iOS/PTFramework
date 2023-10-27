//
//  ChooseImagePopup.swift
//  MediaKits
//
//  Created by Rinkl on 27/10/23.
//

import Foundation
import UIKit

protocol ImagePickerDelegate: class {
    func didSelectImage(_ image: UIImage, isProfile: Bool)
}

class ChooseImagePopup: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var isProfile = false
    let imagePicker = UIImagePickerController()
    weak var delegate: ImagePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        popupView.roundTopCorners(radius: 20.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isProfile == true {
            lblTitle.text = "Profile pic"
        } else {
            lblTitle.text = "Background Image"
        }
        
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapChooseFromLibrary(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.mediaTypes = ["public.image"]
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            delegate?.didSelectImage(selectedImage, isProfile: self.isProfile)
            picker.dismiss(animated: true, completion: {
                self.dismiss(animated: true, completion: nil)
            })
        }
        
        // Dismiss the image picker
        picker.dismiss(animated: true, completion: nil)
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

