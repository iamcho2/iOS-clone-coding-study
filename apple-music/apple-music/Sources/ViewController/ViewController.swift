//
//  ViewController.swift
//  apple-music
//
//  Created by 초이 on 2020/11/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    
    var newsArray = NewsData()
    var gottaHearArray = GottaHearData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 네비게이션 바 .large
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        
        // Register the xib for tableview cell
        let newsCellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        self.mainTableView.register(newsCellNib, forCellReuseIdentifier: NewsTableViewCell.identifier)
        let gottaHearCellNib = UINib(nibName: "GottaHearTableViewCell", bundle: nil)
        self.mainTableView.register(gottaHearCellNib, forCellReuseIdentifier: GottaHearTableViewCell.identifier)
        
        //tableView separator 없애기
        mainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        // 권한 위임
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }


}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 17
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 365
        }else if (indexPath.row == 1){
            return 305
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as? NewsTableViewCell {
                //table view cell 내의 collection view에게 데이터 전달
                let rowArray = newsArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        } else if (indexPath.row == 1) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: GottaHearTableViewCell.identifier) as? GottaHearTableViewCell {
                let rowArray = gottaHearArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    
}

