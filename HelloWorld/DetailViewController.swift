//
//  DetailViewController.swift
//  HelloWorld
//
//  Created by Xiaoxiao on 9/13/17.
//  Copyright © 2017 WangXiaoxiao. All rights reserved.
//

import UIKit


// Key for data.
struct StringKey {
    static let key = "HelloString"
}

class DetailViewController: UIViewController {
    
    
    // MARK: Properties
    
    @IBOutlet weak var helloLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch the stored string if there is any.
        let defaults = UserDefaults.standard
        if let string = defaults.string(forKey: StringKey.key) {
            
            self.helloLabel.text = string
        }
        else {
            self.helloLabel.text = ""
        }
    }
    
    // Tap the picture to get current time.
    @IBAction func tapTime(_ sender: UIButton) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        let date = dateFormatter.string(from: Date())
        self.helloLabel.text = "Hello World: " + date
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        // If there is a string, store it before move back to the view.
        if let string = helloLabel.text {
            if !string.isEmpty {
                let dafaults = UserDefaults.standard
                dafaults.set(helloLabel.text, forKey: StringKey.key)
            }
        }
        
        // Present the LoginView.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let logInView = storyboard.instantiateViewController(withIdentifier: "LogIn") as! LogInViewController
        self.present(logInView, animated: true, completion: nil)
    }
    
}
