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
        self.navigationBar.barTintColor = UIColor(red: 57, green: 121, blue: 168, alpha: 1.0)
        self.navigationBar.tintColor = UIColor.white
    
        let paragraph = NSMutableParagraphStyle()
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.paragraphStyle :paragraph ,NSAttributedStringKey.foregroundColor: UIColor.white]
        
        if #available(iOS 11.0, *) {
            self.navigationBar.largeTitleTextAttributes = [ NSAttributedStringKey.foregroundColor: UIColor.white]
        } else {
            // Fallback on earlier versions
        }
        
        self.view.backgroundColor = UIColor(red: 57, green: 121, blue: 168, alpha: 1.0)
        self.navigationBar.backgroundColor = UIColor(red: 57, green: 121, blue: 168, alpha: 1.0)

        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
