//
//  UploadViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 12/6/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    
    var picker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.previewImage.image = image
            selectButton.isHidden = true
            postButton.isHidden = false
        }
        
        self.dismiss(animated: true, completion: nil)
            
    }
    
    
    
    
    
    @IBAction func selectPressed(_ sender: Any) {
        
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func postPressed(_ sender: Any) {
        
        AppDelegate.instance().showActivityIndicator()
        
        let uid = Auth.auth().currentUser!.uid
        let ref = Database.database().reference()
        let storage = Storage.storage().reference(forURL: "gs://posetography-99570.appspot.com")
        
        let profileRef = storage.child("users").child("\(uid).jpg")
        
        profileRef.downloadURL(completion: { (url, error) in
            if error != nil {
                print (error!.localizedDescription)
            }
            
            if let url = url {
                let userProfilePath = url.absoluteString
            }
        })
        
        let key = ref.child("posts").childByAutoId().key!
        let imageRef = storage.child("posts").child(uid).child("\(key).jpg")
        
        let data = self.previewImage.image!.jpegData(compressionQuality: 0.9)
        
        let uploadTask = imageRef.putData(data!, metadata: nil) { (metadata, error) in
            if error != nil {
                print (error!.localizedDescription)
                AppDelegate.instance().dismissActivityIndicator()
                return
            }
            imageRef.downloadURL(completion: { (url, error) in
                
    
                if let url = url {
                    
                    profileRef.downloadURL(completion: { (profileUrl, err) in
                        
                        if let profileUrl = profileUrl {
                            
                            let feed = ["userID": uid,
                                        "pathToImage": url.absoluteString,
                                        "likes": 0,
                                        "author": Auth.auth().currentUser!.displayName!,
                                        "postID": key,
                                        "userProfile": profileUrl.absoluteString] as [String: Any]
                            
                            
                            let postFeed = ["\(key)": feed]
                            
                            ref.child("posts").updateChildValues(postFeed)
                            
                            AppDelegate.instance().dismissActivityIndicator()
                            
                            self.dismiss(animated: true, completion: nil)

                        }
                        
                        
                    })

                }
                
            })
        }
        
        uploadTask.resume()
    
    }

}
