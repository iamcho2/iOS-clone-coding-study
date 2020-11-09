//
//  Post.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/08.
//

import UIKit

struct Post {
    var category: String
    var nickname: String
    var location: String
    var certificationNum: String
    var time: String
    var content: String
    var profileImageName: String
    var commentNum: Int
    
    
    func makeItemImage() -> UIImage?{
        return UIImage(named: profileImageName)
    }
}
