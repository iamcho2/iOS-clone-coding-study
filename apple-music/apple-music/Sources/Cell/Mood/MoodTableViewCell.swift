//
//  MoodTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class MoodTableViewCell: UITableViewCell {
    static let identifier = "moodTableViewCell"
    @IBOutlet weak var moodCollectionView: UICollectionView!
    
    var mood: [Mood] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 180, height: 125)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5.0
        self.moodCollectionView.collectionViewLayout = flowLayout
        self.moodCollectionView.showsHorizontalScrollIndicator = false
        moodCollectionView.decelerationRate = .fast
        moodCollectionView.isPagingEnabled = false
        
        // Comment if you set Datasource and delegate in .xib
        self.moodCollectionView.dataSource = self
        self.moodCollectionView.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "MoodCollectionViewCell", bundle: nil)
        self.moodCollectionView.register(cellNib, forCellWithReuseIdentifier: MoodCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - UICollectionViewDataSource
extension MoodTableViewCell: UICollectionViewDataSource {
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [Mood]) {
        self.mood = row
        self.moodCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCollectionViewCell.identifier, for: indexPath) as? MoodCollectionViewCell {
            cell.setCell(mood: mood[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewFlowLayout
extension MoodTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
