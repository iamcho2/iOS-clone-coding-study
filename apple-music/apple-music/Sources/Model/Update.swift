//
//  Update.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import Foundation
import UIKit

struct Update {
    var title: String
    var subTitle: String
    var updateImageName: String
    
    func makeUpdateImage() -> UIImage?{
        return UIImage(named: updateImageName)
    }
}
