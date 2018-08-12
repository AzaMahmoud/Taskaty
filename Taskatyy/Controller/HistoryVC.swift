//
//  HistoryVC.swift
//  Taskatyy
//
//  Created by zoza on 24/07/2018.
//  Copyright © 2018 zoza. All rights reserved.
//
// S@m@Elm@sry
import UIKit

class HistoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var historyResult = [IHistoryResult]()
    let cellIdentifier = "histCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.historyResult.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let histCell = tableView.dequeueReusableCell(withIdentifier: "histCell", for: indexPath) as? HistoryCell
            else { return UITableViewCell()}
        histCell.userLbl.text = self.historyResult[indexPath.row].userName
        histCell.workItemOperLbl.text = self.historyResult[indexPath.row].workItemOperation
        histCell.operDatLbl.text = self.historyResult[indexPath.row].operationCreatedDate
        histCell.noteLbl.text = self.historyResult[indexPath.row].notes
        
        return histCell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("wwwwwwwwww")
        
        tableView.dataSource = self
        tableView.delegate = self

        startLoading()
        API.changeBand()
            { (error:Error?,success:Bool,data:AnyObject?) in
                print("sssssssssss")
                DispatchQueue.main.async
                    {
                        if success {
                            let r = history(fromDictionary: data as! [String : Any])
                            self.historyResult = r.iHistoryResult
                            self.stopLoading()
                            self.tableView.reloadData()
                            print("history")
                        }
                        else {
                            print("ERROR")
                            return
                            
                        }
                }
        }
        

        
    }

   


}
