//
//  BpCategoryViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 20/6/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit

class BpCategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func kStyle(_ sender: Any) {
        
        
    }
    
    @IBAction func jStyle(_ sender: Any) {
        
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["japStyle11", "japStyle2", "japStyle3", "japStyle4", "japStyle5", "japStyle6", "japStyle9", "japStyle8", "japStyle1", "japStyle10", "japStyle7", "japStyle12"]
        viewC.authorsArray = ["@yossy_pic_", "@yossy_pic_", "@yossy_pic_", "@yossy_pic_", "@yossy_pic_", "@yossy_pic_", "@yossy_pic_", "@yossy_pic_", "@yossy_pic_", "@yossy_pic_", "@yossy_pic_", "@yossy_pic_"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
    }
    
    @IBAction func whiteGirl(_ sender: Any) {
    }
    
    @IBAction func travelling(_ sender: Any) {
    }
    
    @IBAction func forIns(_ sender: Any) {
    }
    
    
    
}
