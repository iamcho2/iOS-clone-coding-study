//
//  UpdateTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class UpdateTableViewCell: UITableViewCell {
    @IBOutlet weak var updateCollectionView: UICollectionView!
    static let identifier = "updateTableViewCell"

    var dailyTop: [Update] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 370, height: 450)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5.0
        self.updateCollectionView.collectionViewLayout = flowLayout
        self.updateCollectionView.showsHorizontalScrollIndicator = false
        updateCollectionView.decelerationRate = .fast
        updateCollectionView.isPagingEnabled = false
        
        // Comment if you set Datasource and delegate in .xib
        self.updateCollectionView.dataSource = self
        self.updateCollectionView.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "UpdateCollectionViewCell", bundle: nil)
        self.updateCollectionView.register(cellNib, forCellWithReuseIdentifier: UpdateCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}

// MARK: - UICollectionViewDataSource
extension UpdateTableViewCell: UICollectionViewDataSource {
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [Update]) {
        self.dailyTop = row
        self.updateCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyTop.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpdateCollectionViewCell.identifier, for: indexPath) as? UpdateCollectionViewCell {
            cell.setCell(update: dailyTop[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewFlowLayout
extension UpdateTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 370, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
