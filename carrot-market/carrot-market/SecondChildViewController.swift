//
//  SecondChildViewController.swift
//  carrot-market
//
//  Created by 초이 on 2020/11/02.
//

import UIKit
import XLPagerTabStrip

class SecondChildViewController: UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var moreInfoBtn: UIButton!
    @IBOutlet weak var enterBtn: UIButton!
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 14),
        .foregroundColor: UIColor.darkGray,
        .underlineStyle: NSUnderlineStyle.single.rawValue]
           //.double.rawValue, .thick.rawValue
    
    var childNumber: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.enterBtn.layer.cornerRadius = 4
        self.enterBtn.clipsToBounds = true
        
        let attributeString = NSMutableAttributedString(string: "동네생활이 더 궁금하세요?",
                                                             attributes: yourAttributes)
        moreInfoBtn.setAttributedTitle(attributeString, for: .normal)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {

        return IndicatorInfo(title: "\(childNumber)")

      }

}
