//
//  ImageCell.swift
//  Taskatyy
//
//  Created by zoza on 06/08/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    
    @IBOutlet weak var removeImage: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var addImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
    }
    
}
