//
//  WelcomeViewController.swift
//  Pods-PTFramework_Example
//
//  Created by theonetech on 27/10/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.welcomeLbl.text = "Welcome Pooja!! 🤗"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
