//
//  Mood.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import Foundation
import UIKit

struct Mood {
    var title: String
    var moodImageName: String
    
    func setMoodImage()-> UIImage? {
        return UIImage(named: moodImageName)
    }
}
