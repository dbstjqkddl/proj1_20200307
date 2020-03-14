//
//  vcSearch.swift
//  proj1_20200307
//
//  Created by 변윤섭 on 2020/03/07.
//  Copyright © 2020 변윤섭. All rights reserved.
//

import UIKit

class vcSearch: UIViewController {

    @IBOutlet weak var scbSearch: UISearchBar!
    @IBOutlet weak var clvSearch: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clvSearch.delegate = self
        clvSearch.dataSource = self
        clvSearch.register(UINib(nibName: "cvcSearch", bundle: nil), forCellWithReuseIdentifier: "cvcSearch")
        
        setBackgroundColor()
        title = LS("nav_title_main")
    }
    
}

extension vcSearch : UICollectionViewDelegate, UICollectionViewDataSource{
    
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
