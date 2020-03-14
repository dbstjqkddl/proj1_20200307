//
//  vcSetting.swift
//  proj1_20200307
//
//  Created by 변윤섭 on 2020/03/14.
//  Copyright © 2020 변윤섭. All rights reserved.
//

import UIKit

class vcSetting: UIViewController {

    @IBOutlet weak var swcAd: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ad = UserDefaults.standard.bool(forKey: ud.ad)
        
        if ad == true {
            swcAd.setOn(true, animated: false)
        } else {
            swcAd.setOn(false, animated: false)
        }
        
    }
    
    @IBAction func swcBtnClicked(_ sender: UISwitch) {
        if swcAd.isOn {
            UserDefaults.standard.set(true, forKey: ud.ad)
            print("광고제거함")
        } else {
            UserDefaults.standard.set(false, forKey: ud.ad)
            print("광고제거 안함")
        }
        
        infoRestart("앱이 재실행 됩니다.")
    }
    
}


