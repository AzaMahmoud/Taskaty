//
//  editVCViewController.swift
//  Taskatyy
//
//  Created by zoza on 20/05/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class editVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if (pickerView.tag == 1){
            return (resultt?.filterIOSResult?.itemPrograms?.count) ?? 0
        }
        else if (pickerView.tag == 2){
            return (resultt?.filterIOSResult?.itemtype?.count) ?? 0
        }
        else if (pickerView.tag == 3){
            return (resultt?.filterIOSResult?.itemPriorities?.count) ?? 0
        }
        else if (pickerView.tag == 4){
            return (resultt?.filterIOSResult?.itemusers.count) ?? 0
        }
            
        else { return 0}
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return resultt?.filterIOSResult?.itemPrograms?[row].workItemProgram ?? ""
            
        }
        else if (pickerView.tag == 2){
            return resultt?.filterIOSResult?.itemtype?[row].workItemType ?? ""
        }
        else if (pickerView.tag == 3){
            return resultt?.filterIOSResult?.itemPriorities?[row].workItemPriority ?? ""
        }
        else if (pickerView.tag == 4)
        {
            return resultt?.filterIOSResult?.itemusers?[row].userName ?? ""
        }
        else {return ""}
    }
    
    @IBOutlet weak var txtBandNo: UITextField!
    @IBOutlet weak var txtBandAdd: UITextField!
    
    @IBOutlet weak var txtBandDat: UITextField!
    
    @IBOutlet weak var pickProg: UIPickerView!
    
    @IBOutlet weak var pickType: UIPickerView!
    
    @IBOutlet weak var pickPerior: UIPickerView!
    
    @IBOutlet weak var txtBandStatus: UITextField!
    
    @IBOutlet weak var txtVBandDetail: UITextView!
    
    @IBOutlet weak var txtSender: UITextField!
    
    @IBOutlet weak var pickRespons: UIPickerView!
    
    @IBOutlet weak var txtAssignDat: UITextField!
    
    @IBOutlet weak var txtDlvrDat: UITextField!
    
    @IBAction func btnSpclDat(_ sender: UIButton) {
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                let date = formatter.string(from: dt)
                sender.setTitle(date, for: .normal)
                sender.setTitleColor(UIColor.black, for: .normal)
            }
        }
    }
    

    @IBAction func btnDelDat(_ sender: UIButton) {
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                let date = formatter.string(from: dt)
                sender.setTitle(date, for: .normal)
                sender.setTitleColor(UIColor.black, for: .normal)
            }
        }
    }
    var pickerviewData : [String : Any] = [:]
    var resultt : Filter?
    var pickedData : [String:Any] = [:]
    var searchWorkItemsResult = [SearchWorkItemsResult]()
    
    override func viewDidLoad() {
        API.filter()
        super.viewDidLoad()
        // fill pickerViews
        pickProg.dataSource = self
        pickProg.delegate = self
        pickType.dataSource = self
        pickType.delegate = self
        pickPerior.dataSource = self
        pickPerior.delegate = self
        pickRespons.dataSource = self
        pickRespons.delegate = self
        
        
        let url = URLs.Filter
        Alamofire.request(url, method: .get, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    print(error)
                case .success( _):
                    
                    let dic = response.result.value as! [String:Any]
                    self.resultt = Filter(fromDictionary: dic)
                    self.reloadPickerViews()
                }
        }
    }
//    override func viewWillAppear(_ animated: Bool) {
//        // get data from previos screen
//                let progId = pickedData["programId"] as? Int
//                let typId = pickedData["typeId"] as? Int
//                let priorId = pickedData["periorityId"] as? Int
//                let statId = pickedData["statusId"] as? Int
//                let useId = pickedData["userId"] as? Int
//                API.show(creator: "0", item: "0", pgIndex: "1", pgsize: "25", asignTo: "\(useId!)", status: "\(statId!)", periority: "\(priorId!)", program: "\(progId!)", type: "\(typId!)", user: "0", lateItem: "0") { (error:Error?,success:Bool,data:AnyObject?) in
//
//                    if success {
//                        let r = Search(fromDictionary: data as! [String : Any])
//                        self.searchWorkItemsResult = r.searchWorkItemsResult
//
//                        print("filll")
//                    }
//                    else {return}
//                }
//        // txtBandNo.text = self.searchWorkItemsResult[""]
//
//    }
    
    
    func reloadPickerViews(){
        
        self.pickProg.selectedRow(inComponent: 0)
        self.pickType.selectedRow(inComponent: 0)
        self.pickPerior.selectedRow(inComponent: 0)
        self.pickRespons.selectedRow(inComponent: 0)
        pickerviewData["programId"] = resultt?.filterIOSResult?.itemPrograms?[0].workItemProgramId
        pickerviewData["typeId"] = resultt?.filterIOSResult?.itemtype?[0].workItemTypeId
        pickerviewData["periorityId"] = resultt?.filterIOSResult?.itemPriorities?[0].workItemPriorityId
        pickerviewData["userId"] = resultt?.filterIOSResult?.itemusers?[0].userId
        
        self.pickProg.reloadAllComponents()
        self.pickType.reloadAllComponents()
        self.pickPerior.reloadAllComponents()
        self.pickRespons.reloadAllComponents()
    }
    
    @IBAction func btnSav(_ sender: UIButton) {
    }
    
    
    
    
    
}
