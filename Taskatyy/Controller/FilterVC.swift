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

    var pickerviewData : [String : Any] = [:]
    static var hidenBnd = ""
    static var LateBand = ""

    
    @IBOutlet weak var picker1: UIPickerView!
    
    @IBOutlet weak var picker2: UIPickerView!
    
    @IBOutlet weak var picker3: UIPickerView!
    
    @IBOutlet weak var picker4: UIPickerView!
    
    @IBOutlet weak var picker5: UIPickerView!
    
    @IBOutlet weak var closBndSwtch: UISwitch!
    
    @IBOutlet weak var latBndSwttch: UISwitch!
    
    @IBAction func showBtnPressed(_ sender: Any) {
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView:UIPickerView, numberOfRowsInComponent component: Int) -> Int
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
            return (resultt?.filterIOSResult?.status?.count) ?? 0
        }
        else if (pickerView.tag == 5)
        {
            return (resultt?.filterIOSResult?.itemusers?.count) ?? 0
        }
        else { return 0}
   }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
   {
        if (pickerView.tag == 1){
//            let xx = result?.filterResult?.itemPrograms?[row].workItemProgramId
//            print(xx)
            return resultt?.filterIOSResult?.itemPrograms?[row].workItemProgram ?? ""
            
        }
        else if (pickerView.tag == 2){
            return resultt?.filterIOSResult?.itemtype?[row].workItemType ?? ""
        }
        else if (pickerView.tag == 3){
            return resultt?.filterIOSResult?.itemPriorities?[row].workItemPriority ?? ""
        }
        else if (pickerView.tag == 4){
            return resultt?.filterIOSResult?.status?[row].workItemStatuS ?? ""
        }
        else if (pickerView.tag == 5)
        {
            return resultt?.filterIOSResult?.itemusers?[row].userName ?? ""
        }
        else {return ""}
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedData = pickerView.selectedRow(inComponent: 0)
        if (pickerView.tag == 1)
        {
            pickerviewData["program"] = selectedData
            pickerviewData["programId"] = resultt?.filterIOSResult?.itemPrograms?[row].workItemProgramId
            print(pickerviewData["program"]!)
            print( resultt?.filterIOSResult?.itemPrograms?[row].workItemProgramId! ?? 0)

        }
        else if (pickerView.tag == 2)
        {
            pickerviewData["type"] = selectedData
            pickerviewData["typeId"] = resultt?.filterIOSResult?.itemtype?[row].workItemTypeId
            print(pickerviewData["type"]!)
            print(pickerviewData["typeId"]!)
        }
        else if (pickerView.tag == 3)
        {
            pickerviewData["periority"] = selectedData
            pickerviewData["periorityId"] = resultt?.filterIOSResult?.itemPriorities?[row].workItemPriorityId
            print(pickerviewData["periority"]!)
            print(resultt?.filterIOSResult?.itemPriorities?[row].workItemPriorityId! ?? 0)
        }
        else if (pickerView.tag == 4)
        {
            pickerviewData["status"] = selectedData
            pickerviewData["statusId"] = resultt?.filterIOSResult?.status?[row].workItemStatusId
            print(pickerviewData["status"]!)
            print(resultt?.filterIOSResult?.status?[row].workItemStatusId! ?? 0)
        }
        else if (pickerView.tag == 5)
        {
            pickerviewData["user"] = selectedData
            pickerviewData["userId"] = resultt?.filterIOSResult?.itemusers?[row].userId
            print(pickerviewData["user"]!)
            print(resultt?.filterIOSResult?.itemusers?[row].userId! ?? 0)
        }
    }
    var resultt : Filter?
    
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
        
        
        FilterVC.hidenBnd = "1"
        FilterVC.LateBand = "1"
        
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
//        API.filter()
//      //  let dic = result.value as! [String:Any]
//                            self.resultt = Filter(fromDictionary: )
//                            self.reloadPickerViews()
    }
    
    @IBAction func hidClosdSwtchPrsd(_ sender: Any) {
        if closBndSwtch.isOn {
            FilterVC.hidenBnd = "1"
        }
        else{
            FilterVC.hidenBnd = "0"
        }
    }
    
    @IBAction func latBandSwtchPrsd(_ sender: Any) {
        if latBndSwttch.isOn {
            FilterVC.LateBand = "1"
        }
        else {
            FilterVC.LateBand = "0"
        }
    }
    
    
    
    func reloadPickerViews(){

        self.picker1.selectedRow(inComponent: 0)
        self.picker2.selectedRow(inComponent: 0)
        self.picker3.selectedRow(inComponent: 0)
        self.picker4.selectedRow(inComponent: 0)
        self.picker5.selectedRow(inComponent: 0)
        pickerviewData["programId"] = resultt?.filterIOSResult?.itemPrograms?[0].workItemProgramId
        pickerviewData["typeId"] = resultt?.filterIOSResult?.itemtype?[0].workItemTypeId
        pickerviewData["periorityId"] = resultt?.filterIOSResult?.itemPriorities?[0].workItemPriorityId
        pickerviewData["statusId"] = resultt?.filterIOSResult?.status?[0].workItemStatusId
        pickerviewData["userId"] = resultt?.filterIOSResult?.itemusers?[0].userId

        self.picker5.reloadAllComponents()
        self.picker4.reloadAllComponents()
        self.picker3.reloadAllComponents()
        self.picker2.reloadAllComponents()
        self.picker1.reloadAllComponents()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if segue.destination is ShowResultVC {

                ShowResultVC.pickedData = pickerviewData
              //  navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

}
