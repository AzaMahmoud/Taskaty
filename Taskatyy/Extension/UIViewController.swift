//
//  UIViewController.swift
//  Taskatyy
//
//  Created by zoza on 06/08/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable{
    
    
    func clearNav(){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.navigationBar.tintColor = .clear
        
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

    }
    
    
    func startLoading(){
        let size = CGSize(width: 50, height: 50)
        NVActivityIndicatorView.DEFAULT_COLOR = UIColor(red: 57.0/255.0, green: 121.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.startAnimating(size, message: "", type: NVActivityIndicatorType.orbit)
    }
    
    func stopLoading(){
        self.stopAnimating()
    }
    
    func showAlert(_ message: String , _ title: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "تاكيد", style: .default, handler: nil))
        self.present(alertController , animated: true)
    }

    
}
