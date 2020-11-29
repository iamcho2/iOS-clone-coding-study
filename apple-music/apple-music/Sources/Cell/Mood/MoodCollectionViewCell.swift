//
//  MoodCollectionViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class MoodCollectionViewCell: UICollectionViewCell {
    static let identifier = "moodCollectionViewCell"

    @IBOutlet weak var moodImageView: UIImageView!
    @IBOutlet weak var moodTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        moodImageView.clipsToBounds = true
        moodImageView.layer.cornerRadius = 5
    }
    
    // MARK: - Functions
    func setCell(mood: Mood){
        moodTitle.text = mood.title
        moodImageView.image = mood.setMoodImage()
    }

}
