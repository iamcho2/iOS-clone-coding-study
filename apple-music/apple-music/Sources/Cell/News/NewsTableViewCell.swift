//
//  NewsTableViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/28.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let identifier = "newsTableViewCell"
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    var news: [News] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 375, height: 250)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5.0
        self.newsCollectionView.collectionViewLayout = flowLayout
        self.newsCollectionView.showsHorizontalScrollIndicator = false
        newsCollectionView.decelerationRate = .fast
        newsCollectionView.isPagingEnabled = false
        
        // Comment if you set Datasource and delegate in .xib
        self.newsCollectionView.dataSource = self
        self.newsCollectionView.delegate = self
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        self.newsCollectionView.register(cellNib, forCellWithReuseIdentifier: "newsCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Functions - 지금처럼 데이터 전달할 땐 안씀
    func setNewsData(){
        news.append(contentsOf: [
            News(category: "CELEBRATING", title: "No Matter what your Christmas look like, we've got the music covered.", newsImageName: "img1")
        ])
    }
}


extension NewsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionViewDataSource
    
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [News]) {
        self.news = row
        self.newsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as? NewsCollectionViewCell {
            cell.setCell(news: news[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 375, height: 365)
        }
    
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.newsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
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
