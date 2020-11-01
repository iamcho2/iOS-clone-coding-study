//
//  ItemTableViewCell.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/01.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    static let identifier = "ItemCell"

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitle: UITextView!
    @IBOutlet weak var itemLocation: UILabel!
    @IBOutlet weak var itemTime: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.itemImageView.layer.cornerRadius = 8
        self.itemImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(item: Item) {
        itemImageView.image = item.makeItemImage()
        itemTitle.text = item.title
        itemLocation.text = item.location
        itemTime.text = "∙\(item.time)"
        itemPrice.text = "\(item.price)원"
    }

}
