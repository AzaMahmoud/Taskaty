//
//  SenderCell.swift
//  Taskatyy
//
//  Created by zoza on 05/08/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit

class SenderCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var messageSender: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
