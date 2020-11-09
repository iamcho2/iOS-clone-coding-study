//
//  ViewController.swift
//  carrot-market-week2
//
//  Created by 초이 on 2020/11/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("asdasd")
    }
}
