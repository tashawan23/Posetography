//
//  sppViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 17/5/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit

class sppViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imagesArray = [String]()
    var authorsArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sppKoreanCell", for: indexPath) as! SppKoreanCell
        cell.imageDisplay.image = UIImage(named: imagesArray[indexPath.row])
        cell.authorLabel.text = authorsArray[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        vc.imageName = imagesArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func authorPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string:"http://www.instagram.com/taramilktea/")! as URL, options: [:], completionHandler: nil)
        
    }
    
}
