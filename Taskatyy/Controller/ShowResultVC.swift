//
//  SearchResultVC.swift
//  Taskatyy
//
//  Created by zoza on 22/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit

class ShowResultVC: UITableViewController {
    
    //fileprivate
    var pickedData : [String:Any] = [:]
    static var pickedDataTemp : [String:Any] = [:]

    var searchWorkItemsResult = [SearchWorkItemsResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "البنود"
        ShowResultVC.pickedDataTemp = pickedData
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let progId = pickedData["programId"] as? Int
        let typId = pickedData["typeId"] as? Int
        let priorId = pickedData["periorityId"] as? Int
        let statId = pickedData["statusId"] as? Int
        let useId = pickedData["userId"] as? Int
        let latItm = FilterVC.LateBand
        let hidnItem = FilterVC.hidenBnd
        startLoading()
        API.show(creator: "0", item: "0", pgIndex: "1", pgsize: "25", asignTo: "\(useId!)", status: "\(statId!)", periority: "\(priorId!)", program: "\(progId!)", type: "\(typId!)", user: "0", lateItem: latItm, HideClosed: hidnItem, catid: "4") { (error:Error?,success:Bool,data:AnyObject?) in
            
            DispatchQueue.main.async
                {
                
            if success {
                let r = Search(fromDictionary: data as! [String : Any])
                self.searchWorkItemsResult = r.searchWorkItemsResult
                self.stopLoading()
                self.tableView.reloadData()
                
                print("shooo")
            }
            else {
                print("ERROR")
                return
                
                    }
        }
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        // needed to clear the text in the back navigation:
        self.navigationItem.title = ""
    }

    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"tableVBG")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var showw : Search?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchWorkItemsResult.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? showResultCell
            else { return UITableViewCell()}
        if self.searchWorkItemsResult[indexPath.row].workItemStatusId == 1 {
            // Yellow Color
            cell.view.backgroundColor = UIColor(red: 249/255, green: 204/255, blue: 85/255, alpha: 1)
        }else if self.searchWorkItemsResult[indexPath.row].workItemStatusId == 2{
            // Blue Color
            cell.view.backgroundColor = UIColor(red: 57.0/255.0, green: 121.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        }else{
            cell.view.backgroundColor = UIColor(red: 249/255, green: 204/255, blue: 85/255, alpha: 1)

        }
        
        cell.date.text = self.searchWorkItemsResult[indexPath.row].assignDate
        cell.detail.text = self.searchWorkItemsResult[indexPath.row].workItemTitle
        cell.developer.text = "Dev: \(self.searchWorkItemsResult[indexPath.row].userAssigned ?? "")"
        
        
        return cell

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
    static var pick_progId = 0
    static var pick_typId = 0
    static var pick_priorId = 0
    static var pick_userId = 0
    static var pick_statusId = 0
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabVC")
        ShowResultVC.text_Band_No = self.searchWorkItemsResult[indexPath.row].workItemId ?? 0
        ShowResultVC.text_Band_add = self.searchWorkItemsResult[indexPath.row].workItemTitle ?? ""
        ShowResultVC.text_Band_date = self.searchWorkItemsResult[indexPath.row].workItemCreatedDate ?? "Date"
        ShowResultVC.text_Band_Delv_Dat = self.searchWorkItemsResult[indexPath.row].endDate as? String ?? "Date"
        ShowResultVC.text_Band_detail = self.searchWorkItemsResult[indexPath.row].workItemDetails ?? ""
        ShowResultVC.text_Status = self.searchWorkItemsResult[indexPath.row].workItemStatus ?? ""
        ShowResultVC.text_Sender = self.searchWorkItemsResult[indexPath.row].userCreated ?? ""
        ShowResultVC.text_SenderId = "\(self.searchWorkItemsResult[indexPath.row].workItemCreatedBy ?? 0)"
        ShowResultVC.pick_prog = self.searchWorkItemsResult[indexPath.row].workItemProgram ?? "البرنامج"
        ShowResultVC.pick_typ = self.searchWorkItemsResult[indexPath.row].workItemType as? String ?? "النوع"
        ShowResultVC.pick_prior = self.searchWorkItemsResult[indexPath.row].workItemPriority ?? "الاهمية"
        ShowResultVC.pick_user = self.searchWorkItemsResult[indexPath.row].userAssigned ?? "تخصيص"
        ShowResultVC.pick_status = self.searchWorkItemsResult[indexPath.row].workItemStatus ?? ""
        ShowResultVC.pick_progId = self.searchWorkItemsResult[indexPath.row].workItemProgramId ?? 0
        ShowResultVC.pick_typId = (self.searchWorkItemsResult[indexPath.row].workItemTypeId as? Int) ?? 0
        ShowResultVC.pick_priorId = self.searchWorkItemsResult[indexPath.row].workItemPriorityId ?? 0
        ShowResultVC.pick_userId = self.searchWorkItemsResult[indexPath.row].workItemCreatedBy ?? 0
        ShowResultVC.pick_statusId = self.searchWorkItemsResult[indexPath.row].workItemStatusId ?? 0

        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    

}

