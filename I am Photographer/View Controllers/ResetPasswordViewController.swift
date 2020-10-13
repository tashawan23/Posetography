//
//  ResetPasswordViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 19/7/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {

    
    @IBOutlet weak var emailFeild: UITextField!
    
    
    @IBOutlet weak var resetLabel: UILabel!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resetButton(_ sender: Any) {
        
        Auth.auth().sendPasswordReset(withEmail: self.emailFeild.text!) { error in
            
            if let error = error {
              print (error.localizedDescription)
            }
            
            self.resetLabel.isHidden = false
            
        }
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
