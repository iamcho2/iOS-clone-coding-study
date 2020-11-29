//
//  GottaHear.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import Foundation
import UIKit

struct GottaHear {
    var title: String
    var subTitle: String
    var gottaHearImageName: String
    
    func makeGottaHearImage() -> UIImage?{
        return UIImage(named: gottaHearImageName)
    }
}
