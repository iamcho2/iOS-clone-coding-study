//
//  RadioTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class RadioTableViewCell: UITableViewCell {
    static let identifier = "radioTableViewCell"
    @IBOutlet weak var radioCollectionView: UICollectionView!
    
    var radio: [Mood] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 180, height: 150)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5.0
        self.radioCollectionView.collectionViewLayout = flowLayout
        self.radioCollectionView.showsHorizontalScrollIndicator = false
        radioCollectionView.decelerationRate = .fast
        radioCollectionView.isPagingEnabled = false
        
        // Comment if you set Datasource and delegate in .xib
        self.radioCollectionView.dataSource = self
        self.radioCollectionView.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "MoodCollectionViewCell", bundle: nil)
        self.radioCollectionView.register(cellNib, forCellWithReuseIdentifier: MoodCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - UICollectionViewDataSource
extension RadioTableViewCell: UICollectionViewDataSource {
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [Mood]) {
        self.radio = row
        self.radioCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return radio.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCollectionViewCell.identifier, for: indexPath) as? MoodCollectionViewCell {
            cell.setCell(mood: radio[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewFlowLayout
extension RadioTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.radioCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        // CollectionView Item Size
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        // 이동한 x좌표 값과 item의 크기를 비교 후 페이징 값 설정
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        let index: Int
        
        // 스크롤 방향 체크
        // item 절반 사이즈 만큼 스크롤로 판단하여 올림, 내림 처리
        if velocity.x > 0 {
            index = Int(ceil(estimatedIndex))
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
        } else {
            index = Int(round(estimatedIndex))
        }
        // 위 코드를 통해 페이징 될 좌표 값을 targetContentOffset에 대입
        targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
    }
}
