//
//  ViewController.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 11/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLoginTextField: UITextField!
    @IBOutlet weak var passwordLoginTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        usernameLoginTextField.text = defaults.string(forKey: "username")
        passwordLoginTextField.text = defaults.string(forKey: "password")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signinButtonClick(_ sender: UIButton) {
        if((usernameLoginTextField.text?.isEmpty)! || (passwordLoginTextField.text?.isEmpty)!) {
            let alertController = UIAlertController(title: "Warning", message: "The field are mandatory", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "loginCorrectSegue", sender: nil)
        }
    }
    
}

