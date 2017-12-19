//
//  SignUpViewController.swift
//  firstMiniChallenge
//
//  Created by Vincenzo Aceto on 13/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var imagePicked: UIImageView!
    @IBOutlet weak var usernameSignupTextField: UITextField!
    @IBOutlet weak var passwordSignupTextField: UITextField!
    @IBOutlet weak var nameSignupTextField: UITextField!
    @IBOutlet weak var surnameSignupTextField: UITextField!
    @IBOutlet weak var dateOfBirthSignupTextField: UITextField!
    @IBOutlet weak var citySignupTextField: UITextField!
    
    var photoPickedFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imagePicked.isUserInteractionEnabled = true
        imagePicked.addGestureRecognizer(tapGestureRecognizer)

        let backTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backTapped(tapGestureRecognizer:)))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(backTapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Fotocamera", style: .default, handler: {(alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                var imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                print("No Camera on this Device")
                let alertController = UIAlertController(title: "No Camera", message: "No Camera on this Device", preferredStyle: UIAlertControllerStyle.alert)
                
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }
            
        })
        let action2 = UIAlertAction(title: "Libreria foto e video", style: .default, handler: {(alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary;
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancella", style: .cancel, handler: {(alert: UIAlertAction) -> Void in
            
            
        })
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
//        openCameraButton()
    }
    
    @objc func backTapped(tapGestureRecognizer: UITapGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }
    
//    func openCameraButton() {
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            var imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = .camera;
//            imagePicker.allowsEditing = false
//            self.present(imagePicker, animated: true, completion: nil)
//        } else {
//            print("No Camera on this Device")
//            let alertController = UIAlertController(title: "No Camera", message: "No Camera on this Device", preferredStyle: UIAlertControllerStyle.alert)
//
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
//
//            self.present(alertController, animated: true, completion: nil)
//        }
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imagePicked.contentMode = .scaleAspectFill //3
        imagePicked.image = chosenImage //4

        imagePicked.layer.borderWidth = 1.0
        imagePicked.layer.masksToBounds = false
        imagePicked.layer.borderColor = UIColor.white.cgColor
        imagePicked.layer.cornerRadius = imagePicked.frame.size.width / 2
        imagePicked.clipsToBounds = true
        
        photoPickedFlag = true
        
        dismiss(animated:true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveImage(imageName: String){
        //create an instance of the FileManager
        let fileManager = FileManager.default
        //get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        //get the image we took with camera
        let image = imagePicked.image!
        //get the PNG data for this image
        let data = UIImagePNGRepresentation(image)
        //store it in the document directory    fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
    }
    
//    func to get the profile image
//
//    func getImage(imageName: String){
//        let fileManager = FileManager.default
//        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
//        if fileManager.fileExists(atPath: imagePath){
//            imageView.image = UIImage(contentsOfFile: imagePath)
//        }else{
//            print("Panic! No Image!")
//        }
//    }
    
    @IBAction func signupButtonClick(_ sender: UIButton) {
        var flag = false;
        var field = ""
        if((usernameSignupTextField.text?.isEmpty)! || !Tools.isValidEmail(email: usernameSignupTextField.text)){
            flag = true
            field = "Email"
        } else if (passwordSignupTextField.text?.isEmpty)! {
            flag = true
            field = "Password"
        } else if (nameSignupTextField.text?.isEmpty)! {
            flag = true
            field = "Name"
        } else if (surnameSignupTextField.text?.isEmpty)! {
            flag = true
            field = "Surname"
        } else if (dateOfBirthSignupTextField.text?.isEmpty)! {
            flag = true
            field = "Date of Birth"
        } else if (citySignupTextField.text?.isEmpty)! {
            flag = true
            field = "City"
        }
        
        if flag {
            
            let alertController = UIAlertController(title: "Warning", message: field + " is mandatory", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            flag = false
        } else {
            //TEST USERDEFAULT
            let defaults = UserDefaults.standard
            let user = usernameSignupTextField.text!
            defaults.set(usernameSignupTextField.text, forKey: "username")
            defaults.set(passwordSignupTextField.text, forKey: "password")
            defaults.set(nameSignupTextField.text, forKey: "name")
            defaults.set(surnameSignupTextField.text, forKey: "surname")
            defaults.set(dateOfBirthSignupTextField.text, forKey: "date")
            defaults.set(citySignupTextField.text, forKey: "city")
            
            if photoPickedFlag {
                saveImage(imageName: usernameSignupTextField.text!)
            }

            print("Firebase Auth")

            Auth.auth().createUser(withEmail: usernameSignupTextField.text!, password: passwordSignupTextField.text!) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    let alertController = UIAlertController(title: "Warning", message: "Registration error, try again", preferredStyle: UIAlertControllerStyle.alert)
                    
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                    flag = false
                }
                else if let user = user {
                    print(user)
                    self.performSegue(withIdentifier: "signupSegue", sender: nil)
                }
            }
        }
    }
    

}
