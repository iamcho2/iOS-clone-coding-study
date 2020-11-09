//
//  PostCell.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/08.
//

import UIKit

class PostCell: UITableViewCell {
    static let identifier = "PostCell"
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var neighborTextField: UITextView!
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        prepareForReuse()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
            categoryLabel.layer.cornerRadius = 5
            categoryLabel.clipsToBounds = true
            categoryLabel.text = "동네생활이야기"

            neighborTextField.translatesAutoresizingMaskIntoConstraints = true
            neighborTextField.isScrollEnabled = false
            neighborTextField.sizeToFit()
            
            ProfileImageView.layer.cornerRadius = 15
            ProfileImageView.clipsToBounds = true
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostCell(post: Post) {
        categoryLabel.text = post.category
        neighborTextField.text = post.content
        ProfileImageView.image = post.makeItemImage()
        nicknameLabel.text = post.nickname
        timeLabel.text = post.time
        locationLabel.text = "\(post.location) 인증 \(post.certificationNum)회"
        if(post.commentNum == 0){
            commentButton.setTitle("댓글 쓰기", for: .normal)
        }else{
            commentButton.setTitle("댓글 \(post.commentNum)", for: .normal)
        }
    }

}

extension UITextView {
    func setTextView() {
    self.translatesAutoresizingMaskIntoConstraints = true
    self.sizeToFit()
    }
}
