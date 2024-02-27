//
//  LoginController.swift
//  News APP
//
//  Created by Nazrin on 04.11.23.
//

import UIKit

class LoginController: UIViewController {
    
    var users = [User]()
    let manager = UserManager()
    
    @IBOutlet weak var donTLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var envelopeImage: UIImageView!
    @IBOutlet weak var iAmHappyLabel: UILabel!
    @IBOutlet weak var welcomeBack: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 20
        
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              !email.isEmpty, !password.isEmpty
        else {
            showAlert(message: "PLease, enter both email and password. If you have no account. Please, register.")
            return
        }
        manager.readData { users in
            if users.contains(where: { $0.email  == email && $0.password == password }) {
                let controller = storyboard?.instantiateViewController(withIdentifier: "SelectTopicController") as! SelectTopicController
                self.navigationController?.show(controller, sender: nil)
            }
        }
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func registerActionButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        controller.delegate = self
        navigationController?.show(controller, sender: nil)
    }
}
extension LoginController: DataTransfer {
    func sendData(email: String, password: String) {
        emailTextField.text = email
        passwordTextField.text = password
    }
}
