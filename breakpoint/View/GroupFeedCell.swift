//
//  GroupFeedCell.swift
//  breakpoint
//
//  Created by Scott Kilbourn on 12/3/17.
//  Copyright © 2017 Scott Kilbourn. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLabel.text = email
        self.contentLabel.text = content
    }
}
