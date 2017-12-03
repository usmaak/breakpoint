//
//  UserCell.swift
//  breakpoint
//
//  Created by Scott Kilbourn on 11/27/17.
//  Copyright © 2017 Scott Kilbourn. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var showing = false
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            if !showing {
                checkImage.isHidden = false
                showing = true
            }
            else {
                checkImage.isHidden = true
                showing = false
            }
        }
    }

    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLabel.text = email
        
        checkImage.isHidden = !isSelected
    }
}
