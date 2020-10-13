//
//  Post.swift
//  I am Photographer
//
//  Created by Youjia Ding on 13/6/20.
//  Copyright © 2020 CoolBeans. All rights reserved.
//

import UIKit

class Post: NSObject {
    
    var author: String!
    var likes: Int!
    var pathToImage: String!
    var userID: String!
    var postID: String!
    var userProfile: String!
    
    var peopleWhoLike: [String] = [String]()

}
