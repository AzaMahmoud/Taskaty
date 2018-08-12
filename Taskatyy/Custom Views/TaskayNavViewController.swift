//
//  TaskayNavViewController.swift
//  Taskatyy
//
//  Created by zoza on 07/08/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit

class TaskayNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor(red: 57.0/255.0, green: 121.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        self.navigationBar.tintColor = UIColor.white
    
        let paragraph = NSMutableParagraphStyle()
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.paragraphStyle :paragraph ,NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if #available(iOS 11.0, *) {
            self.navigationBar.largeTitleTextAttributes = [ NSAttributedStringKey.foregroundColor: UIColor.white]
        } else {
        }
        
        self.view.backgroundColor = UIColor(red: 57.0/255.0, green: 121.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        self.navigationBar.backgroundColor = UIColor(red: 57.0/255.0, green: 121.0/255.0, blue: 168.0/255.0, alpha: 1.0)

        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
    }

    


}
