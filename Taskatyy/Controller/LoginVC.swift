//
//  ViewController.swift
//  Taskatyy
//
//  Created by zoza on 14/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passWordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearNav()
    }

    
    @IBAction func loginPressed(_ sender: Any) {
        
        guard let user = userNameTF.text, !user.isEmpty else {
            showAlert("برجاء اكمال البيانات", "تحذير")
            return
        }
        guard let pass = passWordTF.text, !pass.isEmpty else {
            showAlert("برجاء اكمال البيانات", "تحذير")
                return
        }
        startLoading()
        API.login(user: user, pass: pass, assid: "4") { (error:Error?,success:Bool) in
            if success {
                print("ZZZZZZZZZZ")
                self.stopLoading()
                UserDefaults.standard.set(self.userNameTF.text ?? "" , forKey: "userName")
                let storyboard = UIStoryboard(name: "Main", bundle: nil);
                let vc = storyboard.instantiateViewController(withIdentifier: "FilterVC")
                let nav = TaskayNavViewController(rootViewController: vc)
                self.present(nav, animated: true, completion: nil);
            }
            else{
                return
            }
        }
    }
    
}

