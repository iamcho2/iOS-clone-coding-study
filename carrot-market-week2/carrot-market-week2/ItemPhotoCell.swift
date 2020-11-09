//
//  ItemPhotoCell.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/09.
//

import UIKit

class ItemPhotoCell: UICollectionViewCell {
    static let identifier = "ItemPhotoCell"
    @IBOutlet weak var photoImageView: UIImageView!
    
    func setImage(imageName: String){
        photoImageView.image = UIImage(named: imageName)
    }
    
}
