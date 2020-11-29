//
//  News.swift
//  apple-music
//
//  Created by 초이 on 2020/11/28.
//

import Foundation
import UIKit

struct News {
    var category: String
    var title: String
    var newsImageName: String
    
    func makeNewsImage() -> UIImage?{
        return UIImage(named: newsImageName)
    }
}
