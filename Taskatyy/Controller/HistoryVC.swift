//
//  HistoryVC.swift
//  Taskatyy
//
//  Created by zoza on 24/07/2018.
//  Copyright © 2018 zoza. All rights reserved.
//
// S@m@Elm@sry
import UIKit

class HistoryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var historyResult = [IHistoryResult]()
    let cellIdentifier = "histCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.historyResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let histCell = collectionView.dequeueReusableCell(withReuseIdentifier: "histCell", for: indexPath) as? HistoryCell
            else { return UICollectionViewCell()}
        histCell.userLbl.text = self.historyResult[indexPath.row].userName
        histCell.workItemOperLbl.text = self.historyResult[indexPath.row].workItemOperation
        histCell.operDatLbl.text = self.historyResult[indexPath.row].operationCreatedDate
        histCell.noteLbl.text = self.historyResult[indexPath.row].notes
        
        return histCell

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("wwwwwwwwww")
        
        collectionView.dataSource = self
        collectionView.delegate = self

        API.changeBand()
            { (error:Error?,success:Bool,data:AnyObject?) in
                print("sssssssssss")
                DispatchQueue.main.async
                    {
                        if success {
                            let r = history(fromDictionary: data as! [String : Any])
                            self.historyResult = r.iHistoryResult
                            self.collectionView.reloadData()
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
