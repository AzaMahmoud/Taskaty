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
//            let prog = pickedData["program"] as? Int
//            let typ = pickedData["type"] as? String
//            let prior = pickedData["periority"] as? String
//            let stat = pickedData["status"] as? String
//            let use = pickedData["user"] as? String
        let progId = pickedData["programId"] as? Int
        let typId = pickedData["typeId"] as? Int
        let priorId = pickedData["periorityId"] as? Int
        let statId = pickedData["statusId"] as? Int
        let useId = pickedData["userId"] as? Int
            
      //  }
        
        API.show(creator: "0", item: "0", pgIndex: "1", pgsize: "25", asignTo: "\(useId!)", status: "\(statId!)", periority: "\(priorId!)", program: "\(progId!)", type: "\(typId!)", user: "0", lateItem: "0") { (error:Error?,success:Bool) in
        
            if success {      print("shooo")      }
            else {return}
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pickedData.count/5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? showResultCell
        else { return UICollectionViewCell()}
      //  let ss = pickedData[indexPath.row]
       // cell.date.text = pickedData["AssignDate"] as! String
        return cell
    }
}

