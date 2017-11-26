//
//  MeVC.swift
//  breakpoint
//
//  Created by Scott Kilbourn on 11/25/17.
//  Copyright © 2017 Scott Kilbourn. All rights reserved.
//

import UIKit

class MeVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signOutButtonWasPressed(_ sender: UIButton) {
    }
}
