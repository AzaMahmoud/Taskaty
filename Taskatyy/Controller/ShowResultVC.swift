//
//  SearchResultVC.swift
//  Taskatyy
//
//  Created by zoza on 22/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ShowResultVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    fileprivate let cellIdenttifier = "cell"
    @IBOutlet weak var collectionView: UICollectionView!
    var pickedData : [String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // if  !pickedData.isEmpty   {
            let prog = pickedData["program"] as? Int
            let typ = pickedData["type"] as? Int
            let prior = pickedData["periority"] as? Int
            let stat = pickedData["status"] as? Int
            let use = pickedData["user"] as? Int
            
      //  }
        
        API.show(creator: "0", item: "0", pgIndex: "1", pgsize: "25", asignTo: "\(use!)", status: "\(stat!)", periority: "\(prior!)", program: "\(prog!)", type: "\(typ!)", user: "0", lateItem: "0") { (error:Error?,success:Bool) in
        
//            if success {      print("shooo")      }
//            else {return}
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? showResultCell
        else { return UICollectionViewCell()}
     //   cell.date.text = self.
        return cell
    }
}

