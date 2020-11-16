//
//  NearByViewController.swift
//  carrot-market-week3
//
//  Created by 초이 on 2020/11/16.
//

import UIKit

class NearByViewController: UIViewController {
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var postTableView: UITableView!
    
    // MARK: - Properties
    var posts:[Post] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPostData()
        postTableView.delegate = self
        postTableView.dataSource = self
        
        //현재 뷰에서의 nav bar 아이템 컬러 설정
        self.navigationController?.navigationBar.tintColor = .black

        //현재 뷰에서의 right nav bar button items
        let searchButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.addTarget(self, action: #selector(addTapped), for: UIControl.Event.touchUpInside)
        searchButton.frame = CGRect(x: 0, y: 0, width: 25, height: 40)
        let search = UIBarButtonItem(customView: searchButton)
        
        let interestButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        interestButton.setImage(UIImage(systemName: "plus.rectangle.on.rectangle"), for: .normal)
        interestButton.addTarget(self, action: #selector(addTapped), for: UIControl.Event.touchUpInside)
        interestButton.frame = CGRect(x: 0, y: 0, width: 25, height: 40)
        let interest = UIBarButtonItem(customView: interestButton)

        let bellButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
        bellButton.addTarget(self, action: #selector(addTapped), for: UIControl.Event.touchUpInside)
        bellButton.frame = CGRect(x: 0, y: 0, width: 25, height: 40)
        let bell = UIBarButtonItem(customView: bellButton)

        self.navigationItem.rightBarButtonItems = [bell, interest, search]
    }
    

    // MARK: - Functions
    func setPostData(){
        posts.append(contentsOf: [
            Post(category: "  동네맛집  ", nickname: "유데이", location: "공릉동", certificationNum: "2", time: "3분 전", content: "우와 오늘 맛집 쩌구 어쩌구 쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구", profileImageName: "img1", commentNum: 0),
            Post(category: "  건강  ", nickname: "안녕허세요", location: "하계동", certificationNum: "2", time: "방금 전", content: "우와 오늘 맛집 발견했어요 !!!!! 집 근처라 중고거래할때 매번 참존숯불바베큐 묵동점 앞에서 가능하다고 말씀 드렸는데 , 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구", profileImageName: "img7", commentNum: 4),
            Post(category: "  우리동네사진전  ", nickname: "김이박최", location: "중계2.3동", certificationNum: "2", time: "어제", content: "우와 오늘 맛집 쩌구 어쩌구 저쩌구 쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구", profileImageName: "img5", commentNum: 20),
            Post(category: "  동네맛집  ", nickname: "유데이", location: "공릉동", certificationNum: "2", time: "3분 전", content: "우와 오늘 맛집 쩌구 어쩌구 쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구", profileImageName: "img1", commentNum: 0),
            Post(category: "  동네맛집  ", nickname: "유데이", location: "공릉동", certificationNum: "2", time: "3분 전", content: "우와 오늘 맛집 발견했어요 !!!!! 집 근처라 중고거래할때 매번 참존숯불바베큐 묵동점 앞에서 가능하다고 말씀 드렸는데 , 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구", profileImageName: "img1", commentNum: 4),
            Post(category: "  동네맛집  ", nickname: "유데이", location: "공릉동", certificationNum: "2", time: "3분 전", content: "우와 오늘 맛집 쩌구 어쩌구 저쩌구 쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구", profileImageName: "img1", commentNum: 4),
            Post(category: "  동네맛집  ", nickname: "유데이", location: "공릉동", certificationNum: "2", time: "3분 전", content: "우와 오늘 맛집 쩌구 어쩌구 쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구어쩌구 저쩌구 어쩌구 저쩌구", profileImageName: "img1", commentNum: 0),
        ])
    }

    // MARK: - @IBAction Properties
    @objc func addTapped(){
        print("Tapped")
    }
    
}


// MARK: - UITableViewDelegate
extension NearByViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let selectedItem = items[indexPath.row]
//            if let dvc = self.storyboard?.instantiateViewController(identifier: "ItemInfoViewController") as? ItemInfoViewController {
//                        dvc.item = selectedItem
//                self.navigationController?.pushViewController(dvc, animated: true)
//
//            }
    }
    
}

// MARK: - UITableViewDataSource
extension NearByViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier) as? PostCell else {
                return UITableViewCell()
            }
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView
            cell.setPostCell(post: posts[indexPath.row])
            return cell
    }
}
