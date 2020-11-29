//
//  UpdateCollectionViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class UpdateCollectionViewCell: UICollectionViewCell {
    static let identifier = "updateCollectionViewCell"
    @IBOutlet weak var updateImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        updateImageView.clipsToBounds = true
        updateImageView.layer.cornerRadius = 5
    }
    
    func setCell(update: Update){
        titleLabel.text = update.title
        subTitleLabel.text = update.subTitle
        updateImageView.image = update.makeUpdateImage()
    }

}
