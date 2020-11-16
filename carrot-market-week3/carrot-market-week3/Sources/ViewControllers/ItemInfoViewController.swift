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
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var userItemCollectionView: UICollectionView!
    @IBOutlet weak var recommendCollectionView: UICollectionView!
    @IBOutlet weak var goChatButton: UIButton!
    @IBOutlet weak var ItemInfoScrollView: UIScrollView!
    @IBOutlet weak var heartImageView: UIImageView!
    
    var item: Item?
    var photos: [String] = ["img12", "img9", "img11", "img8", "img10"]
    var isHeartFilled = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .white
        
        
        self.photoCollectionView.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0);
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        pageControlInitLayout()
        setItemInfo()
        
        userItemCollectionView.delegate = self
        userItemCollectionView.dataSource = self
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
        
        goChatButton.layer.cornerRadius = 5
        goChatButton.clipsToBounds = true
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
        
        ItemInfoScrollView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ItemInfoViewController.imageTapped(gesture:)))
        heartImageView.addGestureRecognizer(tapGesture)
        heartImageView.isUserInteractionEnabled = true
    }
    
    func pageControlInitLayout(){
        photoPageControl.numberOfPages = photos.count
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        isHeartFilled.toggle()
        if(!isHeartFilled){
            heartImageView.image = UIImage(systemName: "heart")
        }else{
            heartImageView.image = UIImage(systemName: "heart.fill")
            heartImageView.tintColor = UIColor.orange
        }
    }
    
    func setItemInfo(){
        if let item = item {
//            titleLabel.text = music.title
//            singerLabel.text = music.singer
//            albumImageView.image = music.makeAlbumImage()
        }
    }
}

extension ItemInfoViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.photoCollectionView{
            return photos.count
        }else if collectionView == self.userItemCollectionView{
            return 4
        }else if collectionView == self.recommendCollectionView{
            return 20
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.photoCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemPhotoCell.identifier, for: indexPath) as? ItemPhotoCell else {
                return UICollectionViewCell()
            }
            cell.setImage(imageName: photos[indexPath.item])
            return cell
            
        }else if collectionView == self.userItemCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserItemCell.identifier, for: indexPath) as? UserItemCell else {
                return UICollectionViewCell()
            }
            cell.setUserItemCell()
//            cell.setImage(imageName: photos[indexPath.item])
            return cell
            
        }else if collectionView == self.recommendCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserItemCell.identifier, for: indexPath) as? UserItemCell else {
                return UICollectionViewCell()
            }
            cell.setUserItemCell()
            return cell
        }else{
            return UICollectionViewCell()
        }
        
        
    }
    
    
}


extension ItemInfoViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.photoCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else if collectionView == self.userItemCollectionView{
            return CGSize(width: 160, height: 180)
        }else if collectionView == self.recommendCollectionView{
            return CGSize(width: 160, height: 180)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == self.photoCollectionView{
            return 0
        }else if collectionView == self.userItemCollectionView{
            return 0
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.photoCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if collectionView == self.userItemCollectionView {
            return UIEdgeInsets(top: 5, left: 15, bottom: 0, right: 15)
        }else if collectionView == self.recommendCollectionView{
            return UIEdgeInsets(top: 5, left: 15, bottom: 0, right: 15)
        }else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

extension ItemInfoViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { photoPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width) }
}

extension ItemInfoViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 250{
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barTintColor = .white
            self.navigationController?.navigationBar.topItem?.title = ""
            self.navigationController?.navigationBar.tintColor = .darkGray
            self.navigationController?.navigationBar.alpha = 1
        } else {
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.view.backgroundColor = .clear
            self.navigationController?.navigationBar.topItem?.title = ""
            self.navigationController?.navigationBar.tintColor = .white
        }
    }
}
