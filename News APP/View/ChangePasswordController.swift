//
//  ChangePasswordController.swift
//  News APP
//
//  Created by Nazrin on 19.11.23.
//

import UIKit

class ChangePasswordController: UIViewController {
    
    @IBOutlet weak var repeatPassword: UITextField!
    @IBOutlet weak var lock3: UIImageView!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var lock2: UIImageView!
    @IBOutlet weak var currentPassword: UITextField!
    @IBOutlet weak var lock1: UIImageView!
    @IBOutlet weak var changePassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func changePasswordButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "AccountController") as! AccountController
        navigationController?.show(controller, sender: nil)
    }
}
