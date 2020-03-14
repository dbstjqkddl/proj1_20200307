//
//  ViewController.swift
//  proj1_20200307
//
//  Created by 변윤섭 on 2020/03/07.
//  Copyright © 2020 변윤섭. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    @IBOutlet weak var tbvMain: UITableView!
    @IBOutlet weak var gadAd: GADBannerView!
    @IBOutlet weak var bannerHeight: NSLayoutConstraint!
    
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbvMain.delegate = self
        tbvMain.dataSource = self
        
        setBackgroundColor()
        title = LS("nav_title_main")
        
        interstitial = createAndLoadInterstitial()
        
        let ad = UserDefaults.standard.bool(forKey: ud.ad)
        
        if ad {
            gadAd.isHidden = ad
            bannerHeight.constant = 0
        } else {
            gadAd.isHidden = ad
            bannerHeight.constant = 50
            gadAd.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            gadAd.rootViewController = self
            gadAd.load(GADRequest())
        }
        
        print("gittest")
    }

    @IBAction func buttonClicked(_ sender: UIBarButtonItem) {
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        } else {
          print("Ad wasn't ready")
        }
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    //      1. 셀의 개수 numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    //      2. 셀의 디자인 및 데이터 cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tbvcMain", for: indexPath) as! tbvcMain
        
        cell.clvMain.delegate = self
        cell.clvMain.dataSource = self
        cell.clvMain.register(UINib(nibName: "cvcSearch", bundle: nil), forCellWithReuseIdentifier: "cvcSearch")
        
        return cell
    }
    //      3. 셀의 높이 heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    //      1. 셀 개수 numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //      2. 셀 디자인 및 데이터 처리
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvcSearch", for: indexPath) as! cvcSearch
        return cell
    }

}

extension ViewController : GADInterstitialDelegate{
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
      interstitial.delegate = self
      interstitial.load(GADRequest())
      return interstitial
    }

    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
      interstitial = createAndLoadInterstitial()
    }
    
}
