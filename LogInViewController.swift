//
//  LogInViewController.swift
//  HelloWorld
//
//  Created by Xiaoxiao on 9/13/17.
//  Copyright © 2017 WangXiaoxiao. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Properties
    
    @IBOutlet weak var noticeLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the notice to empty.
        noticeLabel.text = ""
        
        // Set delegates for textfields.
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        

    }
    
    // When textfiled starts editing.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = UIColor.black
    }
    
    // Hide the keyboard when editing is done.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    // When the submit is tapped.
    @IBAction func submit(_ sender: UIButton) {
        
        if checkValidInput() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailView = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
            self.present(detailView, animated: true, completion: nil)
        }
    }
    
    // Check if the input is valid.
    func checkValidInput() -> Bool {
    
        if let user = usernameTextField.text {
            
            // When username is less than 8 charrcters.
            if user.characters.count < 8 {
                self.noticeLabel.text = "Username must have at least 8 characters."
                self.usernameTextField.textColor = UIColor.red
                return false
            }
            // When the username is not alphabetic.
            else if !checkAlphabeticString(str: user) {
                self.noticeLabel.text = "Username must be alphabetic."
                self.usernameTextField.textColor = UIColor.red
                return false
            }
            
            if let password = self.passwordTextField.text {
                
                // When the password is less than 8 characters.
                if password.characters.count < 8 {
                    self.noticeLabel.text = "Password must have at least 8 characters."
                    self.passwordTextField.textColor = UIColor.red
                    return false
                }
                else {
                    self.noticeLabel.text = ""
                    return true
                }
            }
        }
        return false

    }
    
    // Check if a string is alphabetic.
    func checkAlphabeticString(str: String) -> Bool {
        
        for char in str.characters {
            
            // When any character is not a letter
            if (!(char >= "a" && char <= "z") && !(char >= "A" && char <= "Z")){
                return false
            }
        }
        return true
    }

}
