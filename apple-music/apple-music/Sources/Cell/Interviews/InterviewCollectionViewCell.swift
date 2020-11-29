//
//  InterviewCollectionViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class InterviewCollectionViewCell: UICollectionViewCell {
    static let identifier = "interviewCollectionViewCell"

    @IBOutlet weak var interviewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var intervieweeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(interview: InterView){
        interviewImageView.image = interview.setInterviewImage()
        titleLabel.text = interview.title
        intervieweeLabel.text = interview.interviewee
    }

}
