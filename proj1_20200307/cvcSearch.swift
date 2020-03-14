//
//  cvcSearch.swift
//  proj1_20200307
//
//  Created by 변윤섭 on 2020/03/07.
//  Copyright © 2020 변윤섭. All rights reserved.
//

import UIKit

class cvcSearch: UICollectionViewCell {

    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var imvSearch: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    override func draw(_ rect: CGRect) {
        imvSearch.backgroundColor = .white
        
        btnLike.backgroundColor = .clear
        btnLike.setImage(UIImage(systemName: "heart"), for: .normal)
        
        lblTitle.backgroundColor = .clear
        lblTitle.font = UIFont.boldSystemFont(ofSize: 15)
        lblTitle.textColor = .darkGray
        
        lblDesc.backgroundColor = .clear
        lblDesc.font = UIFont.systemFont(ofSize: 13)
        lblDesc.textColor = .darkGray
        
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
    }
}
