//
//  PopOverViewController.swift
//  carrot-market-week2
//
//  Created by 초이 on 2020/11/09.
//

import UIKit

class PopOverViewController: UIViewController {
    @IBOutlet weak var locationTableView: UITableView!
    var locations: [String] = ["공릉1동", "공릉2동", "내 동네 설정하기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationTableView.dataSource = self
        locationTableView.delegate = self
    }
    
}

extension PopOverViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopUpLocationCell.identifier) as? PopUpLocationCell else {
                                       
                    return UITableViewCell()
                }
        cell.setPopUpCell(location: locations[indexPath.row])
        return cell
    }
    
    
}

extension PopOverViewController: UITableViewDelegate{
    
}
