//
//  SignInVC.swift
//  firstSocialMediaApp
//
//  Created by Raphael Reiter on 14/06/2017.
//  Copyright © 2017 Raphael Reiter. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    
    
    @IBOutlet weak var emailField: FancyField!
    
    
    @IBOutlet weak var passwordField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("RAPHAEL: unable to authenticate with facebook - \(error)")
            } else if result?.isCancelled == true {
                print("RAPHAEL: User Canceled FB authentication")
            } else {
                print("RAPHAEL: Successfully authenticated with FB")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }

    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("RAPHAEL: unable to authenticate with Firebase - \(error)")
            } else {
                print("RAPHAEL: Successfully authenticated with Firebase")
                
            }
        })
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("RAPHAEL: Email user authenticate wth FireBase")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("RAPHAEL: Unable to authenticate with firebase using email")
                        } else {
                            print("RAPHAEL: Successfully authenticated with email/ firebase")
                        }
                    })
                }
            })
        
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
}
