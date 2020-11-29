//
//  NewMusicTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class NewMusicTableViewCell: UITableViewCell {
    static let identifier = "newMusicTableViewCell"
    @IBOutlet weak var newMusicCollectionView: UICollectionView!
    
    var newMusic: [GottaHear] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 180, height: 230)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5.0
        self.newMusicCollectionView.collectionViewLayout = flowLayout
        self.newMusicCollectionView.showsHorizontalScrollIndicator = false
        newMusicCollectionView.decelerationRate = .fast
        newMusicCollectionView.isPagingEnabled = false
        
        // Comment if you set Datasource and delegate in .xib
        self.newMusicCollectionView.dataSource = self
        self.newMusicCollectionView.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "GottaHearCollectionViewCell", bundle: nil)
        self.newMusicCollectionView.register(cellNib, forCellWithReuseIdentifier: GottaHearCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewMusicTableViewCell: UICollectionViewDataSource {
    func updateCellWith(row: [GottaHear]) {
        self.newMusic = row
        self.newMusicCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 29
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GottaHearCollectionViewCell.identifier, for: indexPath) as? GottaHearCollectionViewCell {
            cell.setCell(gottaHear: newMusic[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension NewMusicTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
