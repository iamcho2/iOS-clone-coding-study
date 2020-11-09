//
//  Item.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/01.
//

import UIKit

struct Item {
    var itemImageName: String
    var title: String
    var location: String
    var time: String
    var price: String
    
    func makeItemImage() -> UIImage?{
        return UIImage(named: itemImageName)
    }
}
