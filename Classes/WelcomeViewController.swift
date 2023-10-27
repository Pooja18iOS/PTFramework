//
//  WelcomeViewController.swift
//  Pods-PTFramework_Example
//
//  Created by theonetech on 27/10/23.
//

import UIKit

public func MyCustomFrameworkBundle() -> Bundle? {
    let frameworkBundle = Bundle(for: WelcomeViewController.self)
    return frameworkBundle
}

public class WelcomeViewController: UIViewController {

    @IBOutlet weak var txtPwTextField: UITextField!
    @IBOutlet weak var welcomeLbl: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.welcomeLbl.text = "Welcome Pooja!! 🤗"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okBtnAction(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
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
