//
//  AccountController.swift
//  News APP
//
//  Created by Nazrin on 04.11.23.
//

import UIKit

class AccountController: UIViewController {
    
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var taylor: UIImageView!
    @IBOutlet weak var accountView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func mySwitch(_ sender: Any) {
    }
    
    @IBAction func notificationButtonAction(_ sender: Any) {
    }
    
    @IBAction func languagesAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LanguageController") as! LanguageController
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func changePassword(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordController") as! ChangePasswordController
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func termsAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TermsController") as! TermsController
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
}
