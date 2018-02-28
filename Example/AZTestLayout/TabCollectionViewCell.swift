//
//  TabCollectionViewCell.swift
//  AZTestLayout
//
//  Created by Afroz Zaheer on 22/02/2018.
//  Copyright © 2018 Afroz Zaheer. All rights reserved.
//

import UIKit
import WebKit

class TabCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
