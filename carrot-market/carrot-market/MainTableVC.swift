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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setItemData()
        mainTableView.dataSource = self
        mainTableView.delegate = self
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
}

extension MainTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TradingCell.identifier) as? TradingCell else {
            return UITableViewCell()
        }
        cell.setCell(item: items[indexPath.row])
        return cell
    }
}
