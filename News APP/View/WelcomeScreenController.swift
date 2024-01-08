//
//  WelcomeScreenController.swift
//  News APP
//
//  Created by Nazrin on 04.11.23.
//

import UIKit
import Lottie

class WelcomeScreenController: UIViewController {
    
    @IBOutlet weak var WelcomeAnimation: LottieAnimationView!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStartedButton.layer.cornerRadius = 30
        WelcomeAnimation.play()
        WelcomeAnimation.loopMode = .loop
    }
    @IBAction func getStartedAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
}
