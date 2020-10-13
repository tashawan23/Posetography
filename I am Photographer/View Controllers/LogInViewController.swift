//
//  LogInViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 11/6/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var emailVerifyLabel: UILabel!
    
    @IBOutlet weak var wrongPasswordLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func resetPassword(_ sender: Any) {
    }
    
    
    
    @IBAction func logInButton(_ sender: Any) {
        
        guard emailField.text != "", passwordField.text != "" else { return }
        
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!, completion: {(user, error) in
            if let error = error as NSError? {
                
                switch AuthErrorCode(rawValue: error.code) {
                case .wrongPassword:
                    print ("wrong password")
                    self.emailVerifyLabel.isHidden = true
                    self.wrongPasswordLabel.isHidden = false
                    
                default:
                    print (error.localizedDescription)
                }
            }
            
            
            
            if let user = user {
                self.wrongPasswordLabel.isHidden = true
                if (Auth.auth().currentUser?.isEmailVerified)! {
                    print ("User verified")
                    self.emailVerifyLabel.isHidden = true
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersVC")
                    self.present(vc, animated: true, completion: nil)
                } else {
                    print ("User not verified")
                    self.emailVerifyLabel.isHidden = false
                }
                
            
            }
        })
        
        
        
        
        
    }
    
    

}
