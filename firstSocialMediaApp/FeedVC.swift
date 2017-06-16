//
//  FeedVC.swift
//  firstSocialMediaApp
//
//  Created by Raphael Reiter on 16/06/2017.
//  Copyright © 2017 Raphael Reiter. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper


class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

 
    @IBAction func SignOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("RAPHAEL: ID REMOVED FROM KEYCHAIN \(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
        
        
        
    }
    

}
