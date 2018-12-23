//
//  HeaderCollectionReusableView.swift
//  Heady
//
//  Created by Pritam on 22/12/18.
//  Copyright © 2018 parihar. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var lbl : UILabel!
    override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.purple
    
    // Customize here
    
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
}
}
