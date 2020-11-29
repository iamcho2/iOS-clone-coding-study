//
//  InterviewTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class InterviewTableViewCell: UITableViewCell {
    static let identifier = "interviewTableViewCell"
    @IBOutlet weak var interviewCollectionView: UICollectionView!
    
    var interview: [InterView] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 180, height: 170)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5.0
        self.interviewCollectionView.collectionViewLayout = flowLayout
        self.interviewCollectionView.showsHorizontalScrollIndicator = false
        interviewCollectionView.decelerationRate = .fast
        interviewCollectionView.isPagingEnabled = false
        
        // Comment if you set Datasource and delegate in .xib
        self.interviewCollectionView.dataSource = self
        self.interviewCollectionView.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "InterviewCollectionViewCell", bundle: nil)
        self.interviewCollectionView.register(cellNib, forCellWithReuseIdentifier: InterviewCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - UICollectionViewDataSource
extension InterviewTableViewCell: UICollectionViewDataSource {
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [InterView]) {
        self.interview = row
        self.interviewCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interview.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterviewCollectionViewCell.identifier, for: indexPath) as? InterviewCollectionViewCell {
            cell.setCell(interview: interview[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewFlowLayout
extension InterviewTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
