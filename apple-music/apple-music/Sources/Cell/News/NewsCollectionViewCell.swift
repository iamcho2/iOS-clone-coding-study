//
//  NewsCollectionViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/28.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    static let identifier = "newsCollectionViewCell"
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        newsImageView.clipsToBounds = true
        newsImageView.layer.cornerRadius = 5
    }
    
    // MARK: - Functions
    func setCell(news: News){
        categoryLabel.text = news.category
        titleLabel.text = news.title
        newsImageView.image = makeNewsImage2(newsImageName: news.newsImageName)
    }
    func makeNewsImage2(newsImageName: String) -> UIImage?{
        return UIImage(named: newsImageName)
    }

}
