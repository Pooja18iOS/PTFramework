//
//  CreateMediaKitViewController.swift
//  MediaKits
//
//  Created by Rinkl on 27/10/23.
//

import Foundation
import UIKit

class CreateMediaKitViewController: UIViewController, ImagePickerDelegate {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapBackgroundCamera(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChooseImagePopup") as! ChooseImagePopup
        vc.isProfile = false
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didTapProfilePicCamera(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChooseImagePopup") as! ChooseImagePopup
        vc.isProfile = true
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didTapSaveChanges(_ sender: Any) {
        
    }
    
    @IBAction func didTapAddTag(_ sender: Any) {
        
    }
    
    @IBAction func didTapVerifyMediaName(_ sender: Any) {
        
    }
    
    func didSelectImage(_ image: UIImage, isProfile: Bool) {
        if isProfile == true {
            profileImageView.image = image
        } else {
            backgroundImageView.image = image
        }
    }
}
