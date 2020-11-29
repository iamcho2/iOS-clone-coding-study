//
//  HotTrackCollectionViewCell.swift
//  apple-music
//
//  Created by 초이 on 2020/11/29.
//

import UIKit

class HotTrackCollectionViewCell: UICollectionViewCell {
    static let identifier = "hotTrackCollectionViewCell"
    @IBOutlet weak var songTableView: UITableView!
    
    var song: [HotTrackSong] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let songCellNib = UINib(nibName: "HotTrackSongTableViewCell", bundle: nil)
        self.songTableView.register(songCellNib, forCellReuseIdentifier: HotTrackSongTableViewCell.identifier)
        
        songTableView.dataSource = self
        songTableView.delegate = self
    }
    


}

extension HotTrackCollectionViewCell: UITableViewDataSource {
    func updateCellWith(row: [HotTrackSong]) {
        self.song = row
        self.songTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 8 페이지
        return 8
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HotTrackSongTableViewCell.identifier) as? HotTrackSongTableViewCell {
            //collection view cell 내의 table view에게 데이터 전달
            cell.setCell(hotTrackSong: song[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension HotTrackCollectionViewCell: UITableViewDelegate {
    
}
