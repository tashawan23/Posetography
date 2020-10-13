//
//  UsersTableViewCell.swift
//  I am Photographer
//
//  Created by Youjia Ding on 11/6/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit


class UsersTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var userID: String!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
