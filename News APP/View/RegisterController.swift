//
//  RegisterController.swift
//  News APP
//
//  Created by Nazrin on 04.11.23.
//

import UIKit

protocol DataTransfer {
    func sendData(email: String, password: String)
}

class RegisterController: UIViewController {
    let manager = UserManager()
    
    var delegate: DataTransfer?
    var users = [User]()
    
    @IBOutlet weak var passwordRepeatTextField: UITextField!
    @IBOutlet weak var lockkk: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var envelopeImage: UIImageView!
    @IBOutlet weak var alreadyLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var welcomeLab: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.readData { userItems in
            self.users = userItems
        }
        registerButton.layer.cornerRadius = 30
        
    }
    @IBAction func registerAction(_ sender: Any) {
        let user = User(email: emailTextField.text ?? "",
                        password: passwordTextField.text ?? "")
        users.append(user)
        manager.writeData(users: users)
        
        delegate?.sendData(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func loginAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
}
