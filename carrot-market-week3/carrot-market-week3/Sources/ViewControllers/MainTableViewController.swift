//
//  MainTableVC.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/02.
//

import UIKit


class MainTableViewController: UIViewController {
    // MARK: - @IBOutlet Properties
    @IBOutlet var entireView: UIView!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var floatingStackView: UIStackView!
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var nearByButton: UIButton!
    @IBOutlet weak var pencilButton: UIButton!
    
    // MARK: - Properties
    var items:[Item] = []
    lazy var buttons: [UIButton] = [self.nearByButton, self.pencilButton]
    var isShowFloating: Bool = false
    
    //플로팅 버튼 클릭 시 배경 어둡게
    lazy var floatingDimView: UIView = {
            let view = UIView(frame: self.mainTableView.frame)
            view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            view.alpha = 0
            view.isHidden = true

            self.view.insertSubview(view, belowSubview: self.floatingStackView)

            return view
        }()


    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // 함수호출, 권한위임
        setItemData()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        //다음 뷰에서의 nav bar back button 설정
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        //현재 뷰에서의 nav bar 배경 설정
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .black
        
        //현재 뷰에서의 right nav bar button items
        let searchButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.addTarget(self, action: #selector(addTapped), for: UIControl.Event.touchUpInside)
        searchButton.frame = CGRect(x: 0, y: 0, width: 25, height: 40)
        let search = UIBarButtonItem(customView: searchButton)
        
        let interestButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        interestButton.setImage(UIImage(systemName: "text.badge.checkmark.rtl"), for: .normal)
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.alpha = 1
    }
    
    // MARK: - Functions
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
    
    // MARK: - @IBAction Properties
    @objc func popUpLocation(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "PopOverViewController") as! PopOverViewController

        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func addTapped(){
        print("Tapped")
    }
    
    @IBAction func clickFloatingButton(_ sender: UIButton) {
        if isShowFloating {
                    buttons.reversed().forEach { button in
                        UIView.animate(withDuration: 0.3) {
                            button.isHidden = true
                            self.view.layoutIfNeeded()
                        }
                    }

                    UIView.animate(withDuration: 0.5, animations: {
                        self.floatingDimView.alpha = 0
                    }) { (_) in
                        self.floatingDimView.isHidden = true
                    }
                } else {

                    self.floatingDimView.isHidden = false

                    UIView.animate(withDuration: 0.5) {
                        self.floatingDimView.alpha = 1
                    }

                    buttons.forEach { [weak self] button in
                        button.isHidden = false
                        button.alpha = 0

                        UIView.animate(withDuration: 0.3) {
                            button.alpha = 1
                            self?.view.layoutIfNeeded()
                        }
                    }
                }

                isShowFloating = !isShowFloating

                let image = isShowFloating ? UIImage(named: "hide") : UIImage(named: "show")
                let roatation = isShowFloating ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity

                UIView.animate(withDuration: 0.3) {
                    sender.setImage(image, for: .normal)
                    sender.transform = roatation
                }
    }
    
}

// MARK: - UITableViewDelegate
extension MainTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedItem = items[indexPath.row]
            if let dvc = self.storyboard?.instantiateViewController(identifier: "ItemInfoViewController") as? ItemInfoViewController {
                        dvc.item = selectedItem
                self.navigationController?.pushViewController(dvc, animated: true)
                
            }
    }
    
}

// MARK: - UITableViewDataSource
extension MainTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TradingCell.identifier) as? TradingCell else {
                return UITableViewCell()
            }
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView
            cell.setCell(item: items[indexPath.row])
            return cell
    }
}

// MARK: - UIPopoverPresentationControllerDelegate
extension MainTableViewController: UIPopoverPresentationControllerDelegate{
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
