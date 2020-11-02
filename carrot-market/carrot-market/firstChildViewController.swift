//
//  firstChildViewController.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/02.
//

import UIKit
import XLPagerTabStrip

class firstChildViewController: UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var tradingTableView: UITableView!
    var childNumber: String = ""
    
    var Items:[Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setItemData()
        tradingTableView.dataSource = self
    }
    

    func setItemData(){
        Items.append(contentsOf: [
            Item(itemImageName: "img1", title: "귀여운 곰돌이 사진 팝니다", location: "노원구 공릉동", time: "방금 전", price: "3,000"),
            Item(itemImageName: "img2", title: "캐릭터 핀 무료나눔 해요", location: "강북구 수유2동", time: "13초 전", price: "1,000"),
            Item(itemImageName: "img3", title: "이상형 강동원이라고 하는 짤 팜", location: "돈암 제2동", time: "48초 전", price: "5,000"),
            Item(itemImageName: "img4", title: "다마고치", location: "강북구 미아동", time: "7일 전", price: "32,000"),
            Item(itemImageName: "img7", title: "우리 동생이 그린 나비 그림", location: "월계1동", time: "51초 전", price: "10,000"),
            Item(itemImageName: "img5", title: "해피 할로윈/할로윈 인형/할로윈/호박", location: "공릉1동", time: "3일 전", price: "7,000"),
            Item(itemImageName: "img6", title: "당근마켓 클론코딩 해봅시다", location: "중계2.3동", time: "7일 전", price: "1,227")
        ])
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {

        return IndicatorInfo(title: "\(childNumber)")
      }

}

extension firstChildViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(item: Items[indexPath.row])
        return cell
    }
}
