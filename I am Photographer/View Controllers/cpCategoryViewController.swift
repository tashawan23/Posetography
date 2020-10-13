//
//  cpCategoryViewController.swift
//  I am Photographer
//
//  Created by Youjia Ding on 20/6/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit

class cpCategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func beach(_ sender: Any) {
        
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["beach1", "beach2", "beach3", "beach4", "beach5", "beach6", "beach7", "beach8", "beach9", "beach10", "beach11", "beach12"]
        viewC.authorsArray = ["@amebeverly", "@amebeverly", "@amebeverly", "@mariefeandjakesnow", "@mariefeandjakesnow", "@mariefeandjakesnow", "@mariefeandjakesnow", "@mariefeandjakesnow", "@mariefeandjakesnow", "@mariefeandjakesnow", "@mariefeandjakesnow", "@mariefeandjakesnow"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
        
    }
    
    
    
    @IBAction func wedding(_ sender: Any) {
        
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["wedding1", "wedding2", "wedding3", "wedding4", "wedding5", "wedding6", "wedding7", "wedding8", "wedding9", "wedding10", "wedding11", "wedding12"]
        viewC.authorsArray = ["@doyou.film", "@doyou.film", "@doyou.film", "@doyou.film", "@doyou.film", "@doyou.film", "@doyou.film", "@doyou.film", "@doyou.film", "@doyou.film", "@doyou.film", "@doyou.film"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
    }
    
    
    @IBAction func travelling(_ sender: Any) {
        
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["travelling1", "travelling2", "travelling3", "travelling4", "travelling5", "travelling6", "travelling7", "travelling8", "travelling9", "travelling10", "travelling11", "travelling12"]
        viewC.authorsArray = ["@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
    }
    
    
    @IBAction func indoor(_ sender: Any) {
        
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["indoor1", "indoor2", "indoor3", "indoor4", "indoor5", "indoor6", "indoor7", "indoor8", "indoor9", "indoor10", "indoor11", "indoor12"]
        viewC.authorsArray = ["@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly", "@amebeverly"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
    }
    
    
    @IBAction func night(_ sender: Any) {
        
        let viewC = storyboard?.instantiateViewController(withIdentifier: "sppViewController") as! sppViewController
        viewC.imagesArray = ["night1", "night2", "night3", "night4", "night5", "night6", "night7", "night8", "night9", "night10", "night11", "night12"]
        viewC.authorsArray = ["@amebeverly", "@amebeverly", "@mariefeandjakesnow", "@sharonyws", "@mariefeandjakesnow", "@mariefeandjakesnow", "@sharonyws", "@sharonyws", "@amebeverly", "@sharonyws", "@sharonyws", "@sharonyws"]
        
        self.navigationController?.pushViewController(viewC, animated: true)
        
    }
    
    
}
