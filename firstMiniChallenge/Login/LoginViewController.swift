//
//  ViewController.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 11/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    var activityIndicator:UIActivityIndicatorView!

    @IBOutlet weak var usernameLoginTextField: UITextField!
    @IBOutlet weak var passwordLoginTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    
    public var ref : DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        //usernameLoginTextField.text = defaults.string(forKey: "username")
        //passwordLoginTextField.text = defaults.string(forKey: "password")
        
        activityIndicator =  UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.center = view.center
        activityIndicator.isHidden = true
        self.view.addSubview(activityIndicator)
        
        
        ref = Database.database().reference()
        
       
        ref?.child("cities/city3").observe(DataEventType.value, with: {(snapshot) in
            
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            let value = snapshot.value as? NSDictionary
            let username = value?["name"] as? String ?? ""
            //let user = User(username: username, password: <#String#>)
            
        })
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayActivityIndicatorView() -> () {
        UIApplication.shared.beginIgnoringInteractionEvents()
        self.view.bringSubview(toFront: self.activityIndicator)
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func hideActivityIndicatorView() -> () {
        if !self.activityIndicator.isHidden{
            DispatchQueue.main.async {
                UIApplication.shared.endIgnoringInteractionEvents()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                
            }
        }
        
    }

    @IBAction func signinButtonClick(_ sender: UIButton) {
       
        // For easy login during debugging
        if((usernameLoginTextField.text?.isEmpty)! || (passwordLoginTextField.text?.isEmpty)!) {
            let alertController = UIAlertController(title: "Warning", message: "The field are mandatory", preferredStyle: UIAlertControllerStyle.alert)

            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))

            self.present(alertController, animated: true, completion: nil)
        } else if(Tools.isValidEmail(email: usernameLoginTextField.text)){

//            start authentication
            self.displayActivityIndicatorView()


            Auth.auth().signIn(withEmail: usernameLoginTextField.text!, password: passwordLoginTextField.text!) { (user, error) in
                if let error = error {
                    let alertController = UIAlertController(title: "Login Error", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)

                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))

                    self.present(alertController, animated: true, completion: nil)

                }
                else if let user = user {
                    print(user)
                    self.performSegue(withIdentifier: "loginCorrectSegue", sender: nil)
                }
                self.hideActivityIndicatorView()
            }
        }
    }
    
}

