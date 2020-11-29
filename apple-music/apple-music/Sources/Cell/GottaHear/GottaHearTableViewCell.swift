//
//  GottaHearTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class GottaHearTableViewCell: UITableViewCell {
    static let identifier = "gottaHearTableViewCell"
    @IBOutlet weak var gottaHearCollectionView: UICollectionView!
    
    var gottaHear: [GottaHear] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 180, height: 230)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5.0
        self.gottaHearCollectionView.collectionViewLayout = flowLayout
        self.gottaHearCollectionView.showsHorizontalScrollIndicator = false
        gottaHearCollectionView.decelerationRate = .fast
        gottaHearCollectionView.isPagingEnabled = false
        
        // Comment if you set Datasource and delegate in .xib
        self.gottaHearCollectionView.dataSource = self
        self.gottaHearCollectionView.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "GottaHearCollectionViewCell", bundle: nil)
        self.gottaHearCollectionView.register(cellNib, forCellWithReuseIdentifier: GottaHearCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}

// MARK: - UICollectionViewDataSource
extension GottaHearTableViewCell: UICollectionViewDataSource {
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [GottaHear]) {
        self.gottaHear = row
        self.gottaHearCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 17
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GottaHearCollectionViewCell.identifier, for: indexPath) as? GottaHearCollectionViewCell {
            cell.setCell(gottaHear: gottaHear[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewFlowLayout
extension GottaHearTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
