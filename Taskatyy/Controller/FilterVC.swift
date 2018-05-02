//
//  FilterVC.swift
//  Taskatyy
//
//  Created by zoza on 16/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FilterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{

    @IBOutlet weak var picker1: UIPickerView!
    
    @IBOutlet weak var picker2: UIPickerView!
    
    @IBOutlet weak var picker3: UIPickerView!
    
    @IBOutlet weak var picker4: UIPickerView!
    
    @IBOutlet weak var picker5: UIPickerView!
   
    @IBAction func showBtnPressed(_ sender: Any) {
        
    }
    var pickerviewData : [String : Any] = [:]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView:UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if (pickerView.tag == 1){
            return (result?.filterResult?.itemPrograms?.count) ?? 0
        }
        else if (pickerView.tag == 2){
            return (result?.filterResult?.itemtype?.count) ?? 0
        }
        else if (pickerView.tag == 3){
            return (result?.filterResult?.itemPriorities?.count) ?? 0
        }
        else if (pickerView.tag == 4){
            return (result?.filterResult?.status?.count) ?? 0
        }
        else if (pickerView.tag == 5)
        {
            return (result?.filterResult?.itemusers?.count) ?? 0
        }
        else { return 0}
   }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
   {
        if (pickerView.tag == 1){
//            let xx = result?.filterResult?.itemPrograms?[row].workItemProgramId
//            print(xx)
            return result?.filterResult?.itemPrograms?[row].workItemProgram ?? ""
            
        }
        else if (pickerView.tag == 2){
            return result?.filterResult?.itemtype?[row].workItemType ?? ""
        }
        else if (pickerView.tag == 3){
            return result?.filterResult?.itemPriorities?[row].workItemPriority ?? ""
        }
        else if (pickerView.tag == 4){
            return result?.filterResult?.status?[row].workItemStatuS ?? ""
        }
        else if (pickerView.tag == 5)
        {
            return result?.filterResult?.itemusers?[row].userName ?? ""
        }
        else {return ""}
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedData = pickerView.selectedRow(inComponent: 0)
        if (pickerView.tag == 1)
        {
            pickerviewData["program"] = selectedData
            pickerviewData["programId"] = result?.filterResult?.itemPrograms?[row].workItemProgramId
            print(pickerviewData["program"]!)
            print( result?.filterResult?.itemPrograms?[row].workItemProgramId!)
            
        }
        else if (pickerView.tag == 2)
        {
            pickerviewData["type"] = selectedData
            pickerviewData["typeId"] = result?.filterResult?.itemtype?[row].workItemTypeId!
            print(pickerviewData["type"]!)
            print(pickerviewData["typeId"]!)
        }
        else if (pickerView.tag == 3)
        {
            pickerviewData["periority"] = selectedData
            pickerviewData["periorityId"] = result?.filterResult?.itemPriorities?[row].workItemPriorityId
            print(pickerviewData["periority"]!)
            print(result?.filterResult?.itemPriorities?[row].workItemPriorityId!)
        }
        else if (pickerView.tag == 4)
        {
            pickerviewData["status"] = selectedData
            pickerviewData["statusId"] = result?.filterResult?.status?[row].workItemStatusId
            print(pickerviewData["status"]!)
            print(result?.filterResult?.status?[row].workItemStatusId!)
        }
        else if (pickerView.tag == 5)
        {
            pickerviewData["user"] = selectedData
            pickerviewData["userId"] = result?.filterResult?.itemusers?[row].userId
            print(pickerviewData["user"]!)
            print(result?.filterResult?.itemusers?[row].userId!)
        }
    }
    var result : Filter?
    
    override func viewDidLoad() {
        API.filter()
        super.viewDidLoad()
        picker1.delegate = self
        picker1.dataSource = self
        picker2.delegate = self
        picker2.dataSource = self
        picker3.delegate = self
        picker3.dataSource = self
        picker4.delegate = self
        picker4.dataSource = self
        picker5.delegate = self
        picker5.dataSource = self
        let url = URLs.Filter
        Alamofire.request(url, method: .get, headers: nil)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    print(error)
                case .success(let value):
                   
                    let dic = response.result.value as! [String:Any]
                    
                   // print (dic[0])
                    self.result = Filter(fromDictionary: dic)
                    self.reloadPickerViews()
             }
        }
    }
    func reloadPickerViews(){
        
        self.picker1.selectedRow(inComponent: 0)
        self.picker2.selectedRow(inComponent: 0)
        self.picker3.selectedRow(inComponent: 0)
        self.picker4.selectedRow(inComponent: 0)
        self.picker5.selectedRow(inComponent: 0)
        pickerviewData["programId"] = result?.filterResult?.itemPrograms?[0].workItemProgramId
        pickerviewData["typeId"] = result?.filterResult?.itemtype?[0].workItemTypeId
        pickerviewData["periorityId"] = result?.filterResult.itemPriorities?[0].workItemPriorityId
        pickerviewData["statusId"] = result?.filterResult?.status?[0].workItemStatusId
        pickerviewData["userId"] = result?.filterResult?.itemusers?[0].userId
        
        self.picker5.reloadAllComponents()
        self.picker4.reloadAllComponents()
        self.picker3.reloadAllComponents()
        self.picker2.reloadAllComponents()
        self.picker1.reloadAllComponents()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let vc = segue.destination as? ShowResultVC {
                
                vc.pickedData = pickerviewData
            }
        }
    }

}
