//
//  ExploreTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    static let identifier = "exploreTableViewCell"
    @IBOutlet weak var ExploreTableView: UITableView!
    
    var explore = ["Categories", "Top Charts"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        ExploreTableView.dataSource = self
        ExploreTableView.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "MoreExploreTableViewCell", bundle: nil)
        self.ExploreTableView.register(cellNib, forCellReuseIdentifier: MoreExploreTableViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ExploreTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MoreExploreTableViewCell.identifier) as? MoreExploreTableViewCell {
            let titleString = explore[indexPath.row]
            print(titleString)
            cell.setCell(title: titleString)
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ExploreTableViewCell: UITableViewDelegate {
    
}
