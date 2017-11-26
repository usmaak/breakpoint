//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by Scott Kilbourn on 11/25/17.
//  Copyright © 2017 Scott Kilbourn. All rights reserved.
//

import UIKit
import Firebase

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}

class CreatePostVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
        sendButton.bindToKeyboard() //Button will slide up when keyboard opens
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLabel.text = Auth.auth().currentUser?.email
    }

    @IBAction func closeButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonWasPressed(_ sender: UIButton) {
        if textView.text != nil && textView.text != "Say something here..." {
            sendButton.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (complete) in
                if complete {
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    print("There was an error.")
                }

                self.sendButton.isEnabled = true
            })
        }
    }
    
}
