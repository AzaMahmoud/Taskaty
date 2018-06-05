//
//  File.swift
//  Taskatyy
//
//  Created by zoza on 20/05/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
