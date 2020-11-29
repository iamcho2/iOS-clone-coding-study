//
//  ViewController.swift
//  apple-music
//
//  Created by 초이 on 2020/11/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var albumThumbImageView: UIImageView!
    
    var newsArray = NewsData()
    var gottaHearArray = GottaHearData()
    var moodArray = MoodData()
    var weekendArray = WeekendData()
    var hotTrackArray = HotTrackData()
    var newMusicArray = NewMusicData()
    var radioArray = RadioData()
    var dailyTopArray = DailyTopData()
    var updateArray = UpdateData()
    var lovingArray = LovingData()
    var easyArray = EasyData()
    var interviewArray = InterviewData()
    var soonArray = SoonData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        albumThumbImageView.clipsToBounds = true
        albumThumbImageView.layer.cornerRadius = 5
        albumThumbImageView.layer.shadowColor = UIColor.black.cgColor
        albumThumbImageView.layer.shadowOpacity = 1
        albumThumbImageView.layer.shadowOffset = CGSize.zero
        albumThumbImageView.layer.shadowRadius = 3
        
        
        // 네비게이션 바 .large
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        
        // Register the xib for tableview cell
        let newsCellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        self.mainTableView.register(newsCellNib, forCellReuseIdentifier: NewsTableViewCell.identifier)
        let gottaHearCellNib = UINib(nibName: "GottaHearTableViewCell", bundle: nil)
        self.mainTableView.register(gottaHearCellNib, forCellReuseIdentifier: GottaHearTableViewCell.identifier)
        let moodCellNib = UINib(nibName: "MoodTableViewCell", bundle: nil)
        self.mainTableView.register(moodCellNib, forCellReuseIdentifier: MoodTableViewCell.identifier)
        let hotTrackCellNib = UINib(nibName: "HotTrackTableViewCell", bundle: nil)
        self.mainTableView.register(hotTrackCellNib, forCellReuseIdentifier: HotTrackTableViewCell.identifier)
        let newMusicCellNib = UINib(nibName: "NewMusicTableViewCell", bundle: nil)
        self.mainTableView.register(newMusicCellNib, forCellReuseIdentifier: NewMusicTableViewCell.identifier)
        let radioCellNib = UINib(nibName: "RadioTableViewCell", bundle: nil)
        self.mainTableView.register(radioCellNib, forCellReuseIdentifier: RadioTableViewCell.identifier)
        let dailyTopCellNib = UINib(nibName: "DailyTopTableViewCell", bundle: nil)
        self.mainTableView.register(dailyTopCellNib, forCellReuseIdentifier: DailyTopTableViewCell.identifier)
        let updateCellNib = UINib(nibName: "UpdateTableViewCell", bundle: nil)
        self.mainTableView.register(updateCellNib, forCellReuseIdentifier: UpdateTableViewCell.identifier)
        let lovingCellNib = UINib(nibName: "LovingTableViewCell", bundle: nil)
        self.mainTableView.register(lovingCellNib, forCellReuseIdentifier: LovingTableViewCell.identifier)
        let easyCellNib = UINib(nibName: "EasyTableViewCell", bundle: nil)
        self.mainTableView.register(easyCellNib, forCellReuseIdentifier: EasyTableViewCell.identifier)
        let interviewCellNib = UINib(nibName: "InterviewTableViewCell", bundle: nil)
        self.mainTableView.register(interviewCellNib, forCellReuseIdentifier: InterviewTableViewCell.identifier)
        let soonCellNib = UINib(nibName: "SoonTableViewCell", bundle: nil)
        self.mainTableView.register(soonCellNib, forCellReuseIdentifier: SoonTableViewCell.identifier)
        let exploreCellNib = UINib(nibName: "ExploreTableViewCell", bundle: nil)
        self.mainTableView.register(exploreCellNib, forCellReuseIdentifier: ExploreTableViewCell.identifier)
        
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
        return 14
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 365
        }else if(indexPath.row == 1) {
            return 305
        }else if(indexPath.row == 2) {
            return 217
        }else if(indexPath.row == 3) {
            return 305
        }else if(indexPath.row == 4) {
            return 320
        }else if(indexPath.row == 5) {
            return 545
        }else if(indexPath.row == 6) {
            return 230
        }else if(indexPath.row == 7) {
            return 305
        }else if(indexPath.row == 8) {
            return 550
        }else if(indexPath.row == 9) {
            return 305
        }else if(indexPath.row == 10) {
            return 305
        }else if(indexPath.row == 11) {
            return 230
        }else if(indexPath.row == 12) {
            return 305
        }else if(indexPath.row == 13) {
            return 240g
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
        } else if (indexPath.row == 2) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: MoodTableViewCell.identifier) as? MoodTableViewCell {
                let rowArray = moodArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 3) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: GottaHearTableViewCell.identifier) as? GottaHearTableViewCell {
                let rowArray = weekendArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 4) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: HotTrackTableViewCell.identifier) as? HotTrackTableViewCell {
                let rowArray = hotTrackArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 5) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: NewMusicTableViewCell.identifier) as? NewMusicTableViewCell {
                let rowArray = newMusicArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 6) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: RadioTableViewCell.identifier) as? RadioTableViewCell {
                let rowArray = radioArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 7) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: DailyTopTableViewCell.identifier) as? DailyTopTableViewCell {
                let rowArray = dailyTopArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 8) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: UpdateTableViewCell.identifier) as? UpdateTableViewCell {
                let rowArray = updateArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 9) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: LovingTableViewCell.identifier) as? LovingTableViewCell {
                let rowArray = lovingArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 10) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: EasyTableViewCell.identifier) as? EasyTableViewCell {
                let rowArray = easyArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 11) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: InterviewTableViewCell.identifier) as? InterviewTableViewCell {
                let rowArray = interviewArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 12) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SoonTableViewCell.identifier) as? SoonTableViewCell {
                let rowArray = soonArray.objectsArray
                cell.updateCellWith(row: rowArray)
                
                return cell
            }
        }else if (indexPath.row == 13) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ExploreTableViewCell.identifier) as? ExploreTableViewCell {
                
                return cell
            }
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    
}

