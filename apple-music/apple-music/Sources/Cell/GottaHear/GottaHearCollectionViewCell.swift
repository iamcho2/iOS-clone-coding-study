//
//  GottaHearCollectionViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class GottaHearCollectionViewCell: UICollectionViewCell {
    static let identifier = "gottaHearCollectionViewCell"
    
    @IBOutlet weak var gottaHearImageView: UIImageView!
    @IBOutlet weak var GottaHearTitle: UILabel!
    @IBOutlet weak var GottaHearSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        gottaHearImageView.clipsToBounds = true
        gottaHearImageView.layer.cornerRadius = 5
    }
    
    // MARK: - Functions
    func setCell(gottaHear: GottaHear){
        GottaHearTitle.text = gottaHear.title
        GottaHearSubTitle.text = gottaHear.subTitle
        gottaHearImageView.image = gottaHear.makeGottaHearImage()
    }

}
