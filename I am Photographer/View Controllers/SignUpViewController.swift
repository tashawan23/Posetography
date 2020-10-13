//
//  SignUpViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 10/6/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPWField: UITextField!
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var emailValid: UILabel!
    
    
    @IBOutlet weak var passwordMatch: UILabel!
    
    
    
    let picker = UIImagePickerController()
    var userStorage: StorageReference!
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        
        let storage = Storage.storage().reference(forURL: "gs://posetography-99570.appspot.com")
        ref = Database.database().reference()
        userStorage = storage.child("users")
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func selectPicture(_ sender: Any) {
        
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
            
    }
    
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profilePicture.image = image
            nextButton.isHidden = false
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        guard nameField.text != "",
            emailField.text != "",
            passwordField.text != "",
            confirmPWField.text != "" else { return }
        
        if passwordField.text == confirmPWField.text {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                
                if let error = error {
                    print (error.localizedDescription)
                    self.emailValid.isHidden = false
                    self.passwordMatch.isHidden = true
                }
                
                /*
                let actionCodeSettings = ActionCodeSettings()
                actionCodeSettings.url = URL(string: "https://posetography.coolbeans.com")
                // The sign-in operation has to always be completed in the app.
                actionCodeSettings.handleCodeInApp = true
                actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
                actionCodeSettings.setAndroidPackageName("com.example.android",
                installIfNotAvailable: false, minimumVersion: "12")
                
                Auth.auth().sendSignInLink(toEmail: self.emailField.text!, actionCodeSettings: actionCodeSettings) { error in
                    
                    if let error = error {
                          print(error.localizedDescription)
                        //error.localizedDescription
                          return
                        }
                        // The link was successfully sent. Inform the user.
                        // Save the email locally so you don't need to ask the user for it again
                        // if they open the link on the same device.
                    UserDefaults.standard.set(self.emailField.text, forKey: "Email")
                        print("Check your email for link")
                        // ...
                    }
 
                */
                
                Auth.auth().currentUser?.sendEmailVerification { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                }
                
                if let user = user {
                    
                    
                    let changeRequest = Auth.auth().currentUser!.createProfileChangeRequest()
                    changeRequest.displayName = self.nameField.text!
                    changeRequest.commitChanges(completion: nil)
    
                    
                    let imageRef = self.userStorage.child("\(user.user.uid).jpg")
                    
                    let data = self.profilePicture.image!.jpegData(compressionQuality: 0.5)
                    
                    let uploadTask = imageRef.putData(data!, metadata: nil, completion: { (metadata, err) in
                        if err != nil {
                            print (err!.localizedDescription)
                        }
                        imageRef.downloadURL(completion: { (url, er) in
                            if er != nil {
                                print (er!.localizedDescription)
                            }
                            
                            if let url = url {
                                let userInfo: [String: Any] =
                                    ["uid": user.user.uid,
                                     "full name": self.nameField.text!,
                                     "urlToImage": url.absoluteString]
                                
                                self.ref.child("users").child(user.user.uid).setValue(userInfo)
                                
                                
                                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "emailVerify")
                                
                                self.present(vc, animated: true, completion: nil)
                            }
                        })
                    })
                    
                    
                    uploadTask.resume()
                    
                
                }
            })
        
            
        } else {
            
            print ("Password does not match")
            self.passwordMatch.isHidden = false
            self.emailValid.isHidden = true
        }
        
        
        
    }
    
}
