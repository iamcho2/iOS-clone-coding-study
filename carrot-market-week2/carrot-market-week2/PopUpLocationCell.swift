//
//  PopUpLocationCell.swift
//  carrot-market-week2
//
//  Created by 초이 on 2020/11/09.
//

import UIKit

class PopUpLocationCell: UITableViewCell {
    static let identifier = "PopUpLocationCell"
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPopUpCell(location: String){
        locationLabel.text = location
    }

}
