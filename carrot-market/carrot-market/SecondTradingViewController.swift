//
//  SecondTradingViewController.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/02.
//

import UIKit
import XLPagerTabStrip

class SecondTradingViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {

        // Do any additional setup after loading the view.
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1.0)
        settings.style.selectedBarBackgroundColor = .black
        settings.style.buttonBarItemTitleColor = .black
        settings.style.selectedBarHeight = 3.0
        
        super.viewDidLoad()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

      let trading = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "firstChildViewController") as! firstChildViewController

        trading.childNumber = "중고거래"

      let neighbor = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondChildViewController") as! SecondChildViewController

      neighbor.childNumber = "동네생활"

      return [trading, neighbor]

    }
    

}
