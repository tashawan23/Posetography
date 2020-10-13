//
//  SppCategoryViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 18/6/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit

class SppCategoryViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func koreanStyle(_ sender: Any) {
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["spp1", "spp2", "spp3", "spp4", "spp5", "spp8", "spp9", "spp10", "spp11", "spp12", "spp13", "spp14"]
        viewC.authorsArray = ["@kimehwa", "@kimehwa", "@kimehwa", "@kimehwa", "@kimehwa", "@zoopeach", "@zoopeach", "@zoopeach", "@zoopeach", "@frombeginning_", "@frombeginning_", "@pouvoir.b"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
        
    }
    
    @IBAction func forIns(_ sender: Any) {
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["forIns1", "forIns2", "forIns3", "forIns4", "forIns5", "forIns6", "forIns7", "forIns8", "forIns9", "forIns10", "forIns11", "forIns12"]
        viewC.authorsArray = ["@taramilktea", "@taramilktea", "@taramilktea", "@taramilktea", "@taramilktea", "@taramilktea", "@taramilktea", "@taramilktea", "@taramilktea", "@taramilktea", "@taramilktea", "@taramilktea"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
        
    }
    
    @IBAction func americanStyle(_ sender: Any) {
        
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["US1", "US2", "US3", "US4", "US5", "US6", "US7", "US8", "US9", "US10", "US11", "US12"]
        viewC.authorsArray = ["@bryanadamc", "@bryanadamc", "@bryanadamc", "@bryanadamc", "@bryanadamc", "@bryanadamc", "@taylorkaelin", "@taylorkaelin", "@taylorkaelin", "@taylorkaelin", "@marlacatherine", "@marlacatherine"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
    }
    
    @IBAction func japStyle(_ sender: Any) {
        
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["jap1", "jap2", "jap3", "jap4", "jap5", "jap6", "jap7", "jap8", "jap9", "jap10", "jap11", "jap12"]
        viewC.authorsArray = ["@yossy_pic_", "@yossy_pic_", "@photo_park", "@yossy_pic_", "@dammtory", "@photo_park", "@yossy_pic_", "@_harugraphy", "@yossy_pic_", "@_harugraphy", "@shuntosato", "@yossy_pic_"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
    }
    
    @IBAction func europeanStyle(_ sender: Any) {
        
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["EU1", "EU2", "EU3", "EU4", "EU5", "EU6", "EU7", "EU8", "EU9", "EU10", "EU11", "EU12"]
        viewC.authorsArray = ["@marlacatherine", "@marlacatherine", "@marlacatherine", "@marlacatherine", "@marlacatherine", "@marlacatherine", "@marlacatherine", "@marlacatherine", "@marlacatherine", "@marlacatherine", "@marlacatherine", "@marlacatherine"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
    }
    
    
}
