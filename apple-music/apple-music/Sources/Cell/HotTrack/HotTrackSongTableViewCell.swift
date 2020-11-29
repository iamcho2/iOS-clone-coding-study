//
//  HotTrackSongTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class HotTrackSongTableViewCell: UITableViewCell {
    static let identifier = "hotTrackSongTableViewCell"

    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songSinger: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        songImageView.clipsToBounds = true
        songImageView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Functions
    func setCell(hotTrackSong: HotTrackSong){
        songTitle.text = hotTrackSong.title
        songSinger.text = hotTrackSong.singer
        songImageView.image = hotTrackSong.makeHotTrackImage()
    }
    
}
