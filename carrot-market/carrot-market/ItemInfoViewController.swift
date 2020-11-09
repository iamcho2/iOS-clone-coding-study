//
//  ItemInfoViewController.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/09.
//

import UIKit

class ItemInfoViewController: UIViewController {
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var photoPageControl: UIPageControl!
    
    var item: Item?
    var photos: [String] = ["img1", "img2", "img3", "img4", "img5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        pageControlInitLayout()
        setItemInfo()
    }
    
    func pageControlInitLayout(){
        photoPageControl.numberOfPages = photos.count
    }
    
    func setItemInfo(){ //viewDidLoad()에서 호출
        if let item = item {
//            titleLabel.text = music.title
//            singerLabel.text = music.singer
//            albumImageView.image = music.makeAlbumImage()
        }
    }
}

extension ItemInfoViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemPhotoCell.identifier, for: indexPath) as? ItemPhotoCell else {
            return UICollectionViewCell()
        }
        cell.setImage(imageName: photos[indexPath.item])
        
        return cell
    }
    
    
}


extension ItemInfoViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
}

extension ItemInfoViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { photoPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width) }
}
