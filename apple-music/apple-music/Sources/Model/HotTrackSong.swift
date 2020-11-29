//
//  HotTracks.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import Foundation
import UIKit

struct HotTrackSong {
    var title: String
    var singer: String
    var albumImageName: String
    
    func makeHotTrackImage() -> UIImage?{
        return UIImage(named: albumImageName)
    }
}
