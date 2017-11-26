//
//  MeVC.swift
//  breakpoint
//
//  Created by Scott Kilbourn on 11/25/17.
//  Copyright © 2017 Scott Kilbourn. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLabel.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutButtonWasPressed(_ sender: UIButton) {
        let logoutPopup = UIAlertController(title: "logout?", message: "Are you sure that you want to log out?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            }
            catch {
                print(error)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(cancelAction
        )
        self.present(logoutPopup, animated: true, completion: nil)
    }
}
