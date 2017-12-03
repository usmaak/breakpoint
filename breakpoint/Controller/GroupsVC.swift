//
//  SecondViewController.swift
//  breakpoint
//
//  Created by Scott Kilbourn on 11/24/17.
//  Copyright © 2017 Scott Kilbourn. All rights reserved.
//

import UIKit


extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupsTableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else {return UITableViewCell()}
        
        cell.configureCell(title: "Nerd Herd", description: "The nerdiest nerds around", memberCount: 3)
        
        return cell
    }
}

class GroupsVC: UIViewController {
    @IBOutlet weak var groupsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        groupsTableView.delegate = self
        groupsTableView.dataSource = self
    }
}

