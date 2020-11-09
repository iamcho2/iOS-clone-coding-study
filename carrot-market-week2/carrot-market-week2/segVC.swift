//
//  segVC.swift
//  carrot-market-week2
//
//  Created by 초이 on 2020/11/07.
//

import UIKit

class segVC: UIViewController {
    @IBOutlet weak var itemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemTableView.delegate = self
    }

}
extension segVC: UITableViewDelegate{
    
}
