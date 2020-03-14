//
//  extention.swift
//  proj1_20200307
//
//  Created by 변윤섭 on 2020/03/07.
//  Copyright © 2020 변윤섭. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setBackgroundColor() {
        
        view.backgroundColor = .systemPink
    }
    
    func LS(_ stringKey: String) -> String {
        return NSLocalizedString(stringKey, comment: "")
    }
    
    func infoRestart(_ content : String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title : "", message : content , preferredStyle : .alert )
            let ok = UIAlertAction(title : self.LS("ok"), style : .default, handler : {
                (_) in
                 
             let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
             let viewController = mainStoryboard.instantiateViewController(withIdentifier: "tbcontroller") as! UITabBarController
             
                UIApplication.shared.keyWindow?.rootViewController = viewController
                 
            })
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
        
    }
    
}

extension UIColor {
    
    var main : UIColor {
        return UIColor(red: 252/255, green: 186/255, blue: 3/255, alpha: 1)
    }
}


