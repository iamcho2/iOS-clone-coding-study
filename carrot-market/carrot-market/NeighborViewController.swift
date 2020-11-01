//
//  NeighborViewController.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/01.
//

import UIKit

class NeighborViewController: UIViewController {
    @IBOutlet weak var enterBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.enterBtn.layer.cornerRadius = 4
        self.enterBtn.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
