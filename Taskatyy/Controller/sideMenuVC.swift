//
//  sideMenuVC.swift
//  Taskatyy
//
//  Created by zoza on 23/05/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit


class sideMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Exit(_ sender: UIButton) {
        UserStore.removeUser()
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil);
    }
}
