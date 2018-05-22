//
//  RoundTextField.swift
//  Taskatyy
//
//  Created by zoza on 20/05/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
@IBDesignable

class RoundTtextField: UITextField {
    @IBInspectable var cornerRadius: CGFloat = 12 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    var textFieldBorderStyle: UITextBorderStyle = .roundedRect
}
