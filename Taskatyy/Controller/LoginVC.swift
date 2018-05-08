//
//  ViewController.swift
//  Taskatyy
//
//  Created by zoza on 14/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginVC: UIViewController {
    

    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passWordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func loginPressed(_ sender: Any) {
        guard let user = userNameTF.text, !user.isEmpty else {return}
        guard let pass = passWordTF.text, !pass.isEmpty else {return}
        API.login(user: user, pass: pass) { (error:Error?,success:Bool) in
            if success {
                print("ZZZZZZZZZZ")
                let storyboard = UIStoryboard(name: "Main", bundle: nil);
                let vc = storyboard.instantiateViewController(withIdentifier: "mainVc") ;
                self.present(vc, animated: true, completion: nil);
            }
            else{
                return
            }
        }
   
             
        
        }
    
}

