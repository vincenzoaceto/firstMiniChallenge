//
//  MyProfileViewController.swift
//  firstMiniChallenge
//
//  Created by Matteo vena on 19/12/17.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    var data: [String] = ["Email","Password","Date of Birth"]
    var oggetti: [String] = []
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var citta: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.rowHeight = 95
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2;
        profileImage.clipsToBounds = true;
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 62, y: 2, width: 251.0, height: 375.0)
        layer.colors = [UIColor(red:0.25, green:0.36, blue:0.82, alpha:1.0).cgColor, UIColor(red:0.29, green:0.49, blue:0.91, alpha:1.0).cgColor, UIColor(red:0.35, green:0.65, blue:0.94, alpha:1.0).cgColor]
        layer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
        layer.startPoint = CGPoint(x:0.0, y:0.0)
        layer.endPoint = CGPoint(x:0.9, y:0.9)
        view.layer.addSublayer(layer)
        let defaults = UserDefaults.standard
        
        if let user = defaults.string(forKey: "username") {
            oggetti.append(user)
        } else {
            oggetti.append("TEST")
        }
        
        if let password = defaults.string(forKey: "password") {
            var securePassword: String = ""
            for _ in password {
                securePassword.append("*")
            }
            oggetti.append(securePassword)
        } else {
            oggetti.append("PASSWORD")
        }
        
        if let date = defaults.string(forKey: "date") {
            oggetti.append(date)
        } else {
            oggetti.append("DATE")
        }
        if let city = defaults.string(forKey: "city"){
            citta.text = city.uppercased()
        } else {
            citta.text = "CITTA'"

        }
        citta.textColor = UIColor(hue: 0, saturation: 0, brightness: 100, alpha: 100)
        citta.layer.zPosition = CGFloat(2)
        
        if let nameSurname = defaults.string(forKey: "name") {
             if let surname = defaults.string(forKey: "surname") {
                nome.text = nameSurname + " " + surname
             } else {
                nome.text = "NAME SURNAME"
            }
        } else {
            nome.text = "NAME SURNAME"
        }
        nome.textColor = UIColor(hue: 0, saturation: 0, brightness: 100, alpha: 100)
        nome.layer.zPosition = CGFloat(2)
        profileImage.layer.zPosition = CGFloat(2)
        let circle = CAShapeLayer()
        circle.path = UIBezierPath(roundedRect: CGRect(x: 122, y: 88, width: 130, height: 130), cornerRadius: 100).cgPath
        circle.fillColor = UIColor.red.cgColor.copy(alpha: 0)
        circle.strokeColor = UIColor(red:0.29, green:0.69, blue:0.89, alpha:1.0).cgColor
        view.layer.addSublayer(circle)
        let circle1 = CAShapeLayer()
        circle1.path = UIBezierPath(roundedRect: CGRect(x: 112, y: 78, width: 150, height: 150), cornerRadius: 100).cgPath
        circle1.fillColor = UIColor.red.cgColor.copy(alpha: 0)
        circle1.strokeColor = UIColor(red:0.29, green:0.63, blue:0.89, alpha:1.0).cgColor
        view.layer.addSublayer(circle1)
        
        self.tabBarController?.tabBar.items![2].image = #imageLiteral(resourceName: "avatar")
        self.tabBarController?.tabBar.items![2].selectedImage = #imageLiteral(resourceName: "avatar-selected")
        
        
        if let username = defaults.string(forKey: "username") {
            getImage(imageName: username)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile") as! MyProfileTableViewCell
        
        cell.titolo.text = data[indexPath.row]
        cell.titolo.textColor = UIColor(red:0.00, green:0.38, blue:1.00, alpha:1.0)
        cell.titolo.font = UIFont.systemFont(ofSize: 17.0)
        
        cell.informazioni.text = oggetti[indexPath.row]
        cell.informazioni.font = UIFont.systemFont(ofSize: 21.0)
        
        return cell
    }
    
    var newImageView: UIImageView?
    var changeImageButton: UIButton?
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        newImageView = UIImageView(image: imageView.image)
        newImageView?.backgroundColor = .white
        newImageView?.contentMode = .scaleAspectFit
        newImageView?.frame = UIScreen.main.bounds
        newImageView?.isUserInteractionEnabled = true
        changeImageButton = UIButton(frame: CGRect(x: 220.0, y: 33.0, width: 150, height: 30))
        changeImageButton?.setTitle("Change Image", for: .normal)
        changeImageButton?.setTitleColor(UIColor(red:0.00, green:0.38, blue:1.00, alpha:1.0), for: .normal)
        changeImageButton?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(showButton(_:)))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dismissFullscreenImage(_:)))
        newImageView?.addGestureRecognizer(tap)
        newImageView?.addGestureRecognizer(pan)
        self.view.addSubview(newImageView!)
        newImageView?.addSubview(changeImageButton!)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        newImageView?.layer.zPosition = CGFloat(2)
    }
    
    
    
    @objc func showButton(_ sender: UITapGestureRecognizer) {
        sender.view?.addSubview(changeImageButton!)
        if sender.view?.backgroundColor == .white {
            sender.view?.backgroundColor = .black
            changeImageButton?.isHidden = true
        } else {
            sender.view?.backgroundColor = .white
            changeImageButton?.isHidden = false
        }
        
    }
    
    
    @objc func buttonAction(_ sender: UITapGestureRecognizer) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Camera", style: .default, handler: {(alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        })
        let action2 = UIAlertAction(title: "Gallery", style: .default, handler: {(alert: UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: {(alert: UIAlertAction) -> Void in
            
            
        })
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        profileImage.image = image
        newImageView?.image = image
        let defaults = UserDefaults.standard
        if let username = defaults.string(forKey: "username") {
            saveImage(imageName: username)
        }
        self.dismiss(animated:true, completion: nil)
        
    }
    
    
    @objc func dismissFullscreenImage(_ sender: UIPanGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
        func getImage(imageName: String){
            let fileManager = FileManager.default
            let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
            if fileManager.fileExists(atPath: imagePath){
                profileImage.image = UIImage(contentsOfFile: imagePath)
            }else{
                print("Panic! No Image!")
            }
        }

    
    func saveImage(imageName: String){
        //create an instance of the FileManager
        let fileManager = FileManager.default
        //get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        //get the image we took with camera
        let image = profileImage.image!
        //get the PNG data for this image
        let data = UIImagePNGRepresentation(image)
        //store it in the document directory
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
    }
    
    
    
}



