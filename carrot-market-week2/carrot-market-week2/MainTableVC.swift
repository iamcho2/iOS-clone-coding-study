//
//  MainTableVC.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/02.
//

import UIKit


class MainTableVC: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!{
        didSet {
            mainTableView.contentInset = UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
        }
    }
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var upperHeaderView: UIView!
    
    let maxHeight: CGFloat = 100.0
    let minHeight: CGFloat = 100.0
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint! {
        didSet {
            heightConstraint.constant = maxHeight
        }
    }
    var items:[Item] = []
    var posts:[Post] = []
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var selectedIndex = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setItemData()
        setPostData()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setItemData(){
        items.append(contentsOf: [
            Item(itemImageName: "img1", title: "귀여운 곰돌이 사진 팝니다", location: "노원구 공릉동", time: "방금 전", price: "3,000"),
            Item(itemImageName: "img2", title: "캐릭터 핀 무료나눔 해요", location: "강북구 수유2동", time: "13초 전", price: "1,000"),
            Item(itemImageName: "img3", title: "이상형 강동원이라고 하는 짤 팜", location: "돈암 제2동", time: "48초 전", price: "5,000"),
            Item(itemImageName: "img4", title: "다마고치", location: "강북구 미아동", time: "7일 전", price: "32,000"),
            Item(itemImageName: "img7", title: "우리 동생이 그린 나비 그림", location: "월계1동", time: "51초 전", price: "10,000"),
            Item(itemImageName: "img5", title: "해피 할로윈/할로윈 인형/할로윈/호박", location: "공릉1동", time: "3일 전", price: "7,000"),
            Item(itemImageName: "img6", title: "당근마켓 클론코딩 해봅시다", location: "중계2.3동", time: "7일 전", price: "1,227")
        ])
    }
    
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
    
    @IBAction func didIndexChanged(_ sender: UISegmentedControl) {
        selectedIndex.toggle()
        print(selectedIndex)
        mainTableView.reloadData()
    }
}

extension MainTableVC: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            heightConstraint.constant = max(abs(scrollView.contentOffset.y), minHeight)
        } else {
            heightConstraint.constant = minHeight
        }
        let offset = -scrollView.contentOffset.y
        let percentage = (offset-100)/50
        upperHeaderView.alpha = percentage
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(selectedIndex){
            let selectedItem = items[indexPath.row]
            if let dvc = self.storyboard?.instantiateViewController(identifier: "ItemInfoViewController") as? ItemInfoViewController {
                        dvc.item = selectedItem
                self.navigationController?.pushViewController(dvc, animated: true)
                
            }
        }
    }
    
}

extension MainTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(selectedIndex){
            return items.count
        }else{
            return posts.count
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(selectedIndex){
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TradingCell.identifier) as? TradingCell else {
                return UITableViewCell()
            }
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView
            cell.setCell(item: items[indexPath.row])
            return cell
        }else{
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
}

extension MainTableVC: UIPopoverPresentationControllerDelegate{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue for the popover configuration window
           if segue.identifier == "popOverSegue" {
            if let controller = segue.destination as? UIViewController {
                   controller.popoverPresentationController!.delegate = self
                   controller.preferredContentSize = CGSize(width: 300, height: 132)
               }
           }
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {

            return UIModalPresentationStyle.none
        }

       // Tells the delegate that the popover was dismissed.
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
            print("Dismissed popover")
        }
}
