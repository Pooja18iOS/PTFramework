//
//  MediaKitViewController.swift
//  MediaKits
//
//  Created by Rinkl on 26/10/23.
//

import Foundation
import UIKit

class MediaKitViewController: UIViewController {
    
    @IBOutlet weak var btnContactMe: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnContactMe.applyGradient(colours: [.purple, .systemPink])
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension UIView {
    
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    
    func roundTopCorners(radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        
        layer.mask = maskLayer
    }
}
