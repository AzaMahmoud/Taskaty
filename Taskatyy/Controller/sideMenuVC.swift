//
//  sideMenuVC.swift
//  Taskatyy
//
//  Created by zoza on 23/05/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit


class sideMenuVC: UIViewController {

    @IBOutlet weak var logoutImage: UIImageView!
    @IBOutlet weak var addaBandImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        colorImage()
    }
    
    func colorImage(){
        if let image = UIImage(named: "bnd") {
            let tintImage = image.withRenderingMode(.alwaysTemplate)
            addaBandImage.image = tintImage
            addaBandImage.tintColor = UIColor.white
        }
        
        if let image = UIImage(named: "logout") {
            let tintImage = image.withRenderingMode(.alwaysTemplate)
            logoutImage.image = tintImage
            logoutImage.tintColor = UIColor.white
        }

    }

    @IBAction func Exit(_ sender: UIButton) {
        UserStore.removeUser()
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil);
    }
}
