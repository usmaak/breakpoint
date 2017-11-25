//
//  LoginVC.swift
//  breakpoint
//
//  Created by Scott Kilbourn on 11/24/17.
//  Copyright © 2017 Scott Kilbourn. All rights reserved.
//

import UIKit

extension LoginVC: UITextFieldDelegate {
    
}

class LoginVC: UIViewController {

    @IBOutlet weak var passwordField: InsetTextField!
    @IBOutlet weak var emailField: InsetTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signinButtonWasPressed(_ sender: UIButton) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    debugPrint(error?.localizedDescription as Any)
                }
            })
            
            AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text! , userCreationComplete: { (success, error) in
                if success {
                    AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                        if success {
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered user.")
                        }
                        else {
                            print(String(describing: error?.localizedDescription))
                        }
                    })
                }
            })
        }
    }
    
    @IBAction func closeButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
