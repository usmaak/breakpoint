//
//  CreateGroupsVC.swift
//  breakpoint
//
//  Created by Scott Kilbourn on 11/27/17.
//  Copyright © 2017 Scott Kilbourn. All rights reserved.
//

import UIKit

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else {return UITableViewCell()}
        let profileImage = UIImage(named: "defaultProfileImage")
        
        cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        
        return cell
    }
}

extension CreateGroupsVC: UITextFieldDelegate {

}

class CreateGroupsVC: UIViewController {
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        if emailSearchTextField.text == "" {
            emailArray = [String]()
            tableView.reloadData()
        }
        else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!, handler: { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            })
        }

    }

    @IBAction func doneButtonWasPressed(_ sender: UIButton) {
    }
    
    @IBAction func closeButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
