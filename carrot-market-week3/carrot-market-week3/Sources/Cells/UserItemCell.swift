//
//  UserItemCell.swift
//  carrot-market-week2
//
//  Created by 초이 on 2020/11/09.
//

import UIKit

class UserItemCell: UICollectionViewCell {
    static let identifier = "UserItemCell"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    func setUserItemCell() { //post: Post 매개변수에
        itemImageView.layer.cornerRadius = 5
        itemImageView.clipsToBounds = true
        itemImageView.image = UIImage(named: "img8")
        itemNameLabel.text = "카키색 바람막이 팜"
        itemPriceLabel.text = "30,000원"
        
    }
}
