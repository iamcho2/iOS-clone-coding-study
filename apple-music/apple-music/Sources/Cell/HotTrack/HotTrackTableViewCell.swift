//
//  HotTrackTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class HotTrackTableViewCell: UITableViewCell {
    static let identifier = "hotTrackTableViewCell"
    @IBOutlet weak var hotTrackCollectionView: UICollectionView!
    
    var hotTrack: [HotTrack] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 375, height: 240)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5.0
        self.hotTrackCollectionView.collectionViewLayout = flowLayout
        self.hotTrackCollectionView.showsHorizontalScrollIndicator = false
        hotTrackCollectionView.decelerationRate = .fast
        hotTrackCollectionView.isPagingEnabled = false
        
        // Comment if you set Datasource and delegate in .xib
        self.hotTrackCollectionView.dataSource = self
        self.hotTrackCollectionView.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "HotTrackCollectionViewCell", bundle: nil)
        self.hotTrackCollectionView.register(cellNib, forCellWithReuseIdentifier: HotTrackCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - UICollectionViewDataSource
extension HotTrackTableViewCell: UICollectionViewDataSource {
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [HotTrack]) {
        self.hotTrack = row
        self.hotTrackCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotTrackCollectionViewCell.identifier, for: indexPath) as? HotTrackCollectionViewCell {
            let rowArray = hotTrack[indexPath.row].songs
            cell.updateCellWith(row: rowArray)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewFlowLayout
extension HotTrackTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
