//
//  AppDelegate.swift
//  Taskatyy
//
//  Created by zoza on 14/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
          IQKeyboardManager.shared.enable = true
        checkLogin()
        return true
    }
    
    func checkLogin(){
        
        if UserStore.loadUser()?.id != nil {
            let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
            let nav = TaskayNavViewController(rootViewController: viewController)
            window?.rootViewController = nav
        }else{
            let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            let nav = TaskayNavViewController(rootViewController: viewController)
            window?.rootViewController = nav

        }
        
    }
    
    

    
}

