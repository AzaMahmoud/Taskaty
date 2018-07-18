//
//  SearchResultVC.swift
//  Taskatyy
//
//  Created by zoza on 22/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
//import Alamofire
//import SwiftyJSON

class ShowResultVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //fileprivate
    let cellIdenttifier = "cell"
    @IBOutlet weak var collectionView: UICollectionView!
    static var pickedData : [String:Any] = [:]
    var searchWorkItemsResult = [SearchWorkItemsResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let progId = ShowResultVC.pickedData["programId"] as? Int
        let typId = ShowResultVC.pickedData["typeId"] as? Int
        let priorId = ShowResultVC.pickedData["periorityId"] as? Int
        let statId = ShowResultVC.pickedData["statusId"] as? Int
        let useId = ShowResultVC.pickedData["userId"] as? Int
        
        API.show(creator: "0", item: "0", pgIndex: "1", pgsize: "25", asignTo: "\(useId!)", status: "\(statId!)", periority: "\(priorId!)", program: "\(progId!)", type: "\(typId!)", user: "0", lateItem: "0") { (error:Error?,success:Bool,data:AnyObject?) in
            
            DispatchQueue.main.async
                {
                
            if success {
                let r = Search(fromDictionary: data as! [String : Any])
                self.searchWorkItemsResult = r.searchWorkItemsResult
                self.collectionView.reloadData()
                
                print("shooo")
            }
            else {
                print("ERROR")
                return
                
                    }
        }
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    var showw : Search?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.searchWorkItemsResult.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? showResultCell
            else { return UICollectionViewCell()}
        cell.date.text = self.searchWorkItemsResult[indexPath.row].assignDate
        cell.detail.text = self.searchWorkItemsResult[indexPath.row].workItemTitle
        cell.developer.text = self.searchWorkItemsResult[indexPath.row].userAssigned
        
        return cell
        
        
//        guard let edit = collectionView.dequeueReusableCell(withReuseIdentifier:"Edit", for: indexPath) as? editVC
//            else { return UICollectionViewCell()}
    }
    
    static var text_Band_No = 0
    static var text_Band_add = ""
    static var text_Band_date = ""
    static var text_Band_Delv_Dat = ""
    static var text_Band_detail = ""
    static var text_Status = ""
    static var text_Sender = ""
    static var text_SenderId = ""
    static var pick_prog = ""
    static var pick_typ = ""
    static var pick_prior = ""
    static var pick_user = ""
    static var pick_status = ""
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Edit", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit" {
            ShowResultVC.text_Band_No = self.searchWorkItemsResult[sender as! Int].workItemId ?? 0
            ShowResultVC.text_Band_add = self.searchWorkItemsResult[sender as! Int].workItemTitle ?? ""
            ShowResultVC.text_Band_date = self.searchWorkItemsResult[sender as! Int].workItemCreatedDate ?? "Date"
            ShowResultVC.text_Band_Delv_Dat = self.searchWorkItemsResult[sender as! Int].endDate as? String ?? "Date"
            ShowResultVC.text_Band_detail = self.searchWorkItemsResult[sender as! Int].workItemDetails ?? ""
            ShowResultVC.text_Status = self.searchWorkItemsResult[sender as! Int].workItemStatus ?? ""
            ShowResultVC.text_Sender = self.searchWorkItemsResult[sender as! Int].userCreated ?? ""
            ShowResultVC.text_SenderId = "\(self.searchWorkItemsResult[sender as! Int].workItemCreatedBy ?? 0)"
            ShowResultVC.pick_prog = self.searchWorkItemsResult[sender as! Int].workItemProgram ?? "البرنامج"
            ShowResultVC.pick_typ = self.searchWorkItemsResult[sender as! Int].workItemType as? String ?? "النوع"
            ShowResultVC.pick_prior = self.searchWorkItemsResult[sender as! Int].workItemPriority ?? "الاهمية"
            ShowResultVC.pick_user = self.searchWorkItemsResult[sender as! Int].userAssigned ?? "تخصيص"
            ShowResultVC.pick_status = self.searchWorkItemsResult[sender as! Int].workItemStatus ?? ""
//            if let vc = segue.destination as? editVC {
//              vc.pickerviewData = pickedData
//              navigationController?.pushViewController(vc, animated: true)
//            }
        }
    }

}

