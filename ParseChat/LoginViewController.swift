/*

//
//  ViewController.swift
//  ParseChat
//
//  Created by Harika Lingareddy on 2/4/18.
//  Copyright © 2018 Harika Lingareddy. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    let userExistsAlert = UIAlertController(title: "User Exists", message: "The username you have chosen already exists", preferredStyle: .alert)
    let invalidAlert = UIAlertController(title: "Invalid ", message: "The username or password was invalid. Please try again.", preferredStyle: .alert)
    
   
    @IBAction func onSignup(_ sender: Any) {
        //registerUser()
        if !usernameLabel.hasText || !passwordLabel.hasText {
            present(invalidAlert, animated: true) {
                
            }
        } else {
            registerUser()
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        //loginUser()
        if !usernameLabel.hasText || !passwordLabel.hasText {
            present(invalidAlert, animated: true) {
                
            }
        } else {
            loginUser()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAlertControllers()
        
        usernameLabel.delegate = self
        passwordLabel.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameLabel.text
        newUser.password = passwordLabel.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                if String(describing: error.localizedDescription).contains("Account already exists for this username.") {
                    print("This user already has an account!!")
                    
                    self.present(self.userExistsAlert, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
                
            } else {
                print("User Registered successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    func setupAlertControllers() {
        // Set up alert for pre-existing username
        let OKAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
            
        }
        self.userExistsAlert.addAction(OKAction)
        self.invalidAlert.addAction(OKAction)
        
    }
    
    func loginUser() {
        
        let username = usernameLabel.text ?? ""
        let password = passwordLabel.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
                self.present(self.invalidAlert, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }

        
        


}





