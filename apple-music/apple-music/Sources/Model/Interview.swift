//
//  Interview.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import Foundation
import UIKit

struct InterView {
    var title: String
    var interviewee: String
    var interviewImageName: String
    
    func setInterviewImage()-> UIImage? {
        return UIImage(named: interviewImageName)
    }
}
