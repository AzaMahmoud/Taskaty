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
   
    
   
    
    @IBOutlet weak var txtBandNo: UITextField!
    @IBOutlet weak var txtBandAdd: UITextField!
    @IBOutlet weak var txtBandDat: UITextField!
    @IBOutlet weak var pickProg: UIPickerView!
    @IBOutlet weak var pickType: UIPickerView!
    @IBOutlet weak var pickPerior: UIPickerView!
    @IBOutlet weak var pickStatus: UIPickerView!
    @IBOutlet weak var txtBandStatus: UITextField!
    @IBOutlet weak var txtVBandDetail: UITextView!
    @IBOutlet weak var txtSender: UITextField!
    @IBOutlet weak var pickRespons: UIPickerView!
    @IBOutlet weak var btnSpec: UIButton!
    @IBOutlet weak var btnDelv: UIButton!
    @IBOutlet weak var btnProg: UIButton!
    @IBOutlet weak var btnTyp: UIButton!
    @IBOutlet weak var btnPrior: UIButton!
    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var btnUser: UIButton!
    
    
    
    //  @IBOutlet weak var txtAssignDat: UITextField!
    
  //  @IBOutlet weak var txtDlvrDat: UITextField!
//    var text_Band_No = 0
//    var text_Band_add = ""
//    var text_Band_date = ""
//    var text_Band_Delv_Dat = ""
//    var text_Band_detail = ""
//    var text_Status = ""
//    var text_Sender = ""
//    var text_SenderId = ""
//    var pick_prog = ""
//    var pick_typ = ""
//    var pick_prior = ""
    var pick_user = ""
    var pick_status = ""
    var endDate = ""
    var progammId : Int?
    var typpId : Int?
    var periorrId : Int?
    var responderId : Int?
    var statusId : Int?
    var progId = 0
    var typId = 0
    var priorId = 0
    var statId = 0
    var useId = 0
    
    
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
                self.endDate = date
                sender.setTitle(date, for: .normal)
                sender.setTitleColor(UIColor.black, for: .normal)
            }
        }
    }
    
    @IBAction func btnProgPrsd(_ sender: UIButton) {
        btnProg.isHidden = true
        pickProg.isHidden = false
    }
    
    @IBAction func btnTypPrsd(_ sender: UIButton) {
        btnTyp.isHidden = true
        pickType.isHidden = false
    }
    
    @IBAction func btnPriorPrsd(_ sender: UIButton) {
        btnPrior.isHidden = true
        pickPerior.isHidden = false
    }
    
    @IBAction func btnUsrPrsd(_ sender: UIButton) {
        btnUser.isHidden = true
        pickRespons.isHidden = false
    }
    
    @IBAction func btnStusPrsd(_ sender: UIButton) {
        btnStatus.isHidden = true
        pickStatus.isHidden = false
    }
    
    
    var pickerviewData : [String : Any] = [:]
    var resultt : Filter?
    var pickedData : [String:Any] = ShowResultVC.pickedDataTemp
    var searchWorkItemsResult = [SearchWorkItemsResult]()
    
    override func  viewDidLoad() {
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
        pickStatus.dataSource = self
        pickStatus.delegate = self
        
        DispatchQueue.main.async {
        
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
//            self.pickProg.dataSource = self
//            self.pickProg.delegate = self
            
            
            self.txtBandNo.text = "\(ShowResultVC.text_Band_No)"
            self.txtBandAdd.text = ShowResultVC.text_Band_add
            self.btnSpec.setTitle(ShowResultVC.text_Band_date , for: .normal)
            self.btnDelv.setTitle(ShowResultVC.text_Band_Delv_Dat , for: .normal)
            self.txtBandDat.text = ShowResultVC.text_Band_date
            self.txtVBandDetail.text = ShowResultVC.text_Band_detail
           // self.txtBandStatus.text = ShowResultVC.text_SenderId //
            self.txtSender.text = ShowResultVC.text_Sender
            self.btnProg.setTitle(ShowResultVC.pick_prog, for: .normal)
            self.btnTyp.setTitle(ShowResultVC.pick_typ, for: .normal)
            self.btnPrior.setTitle(ShowResultVC.pick_prior, for: .normal)
            self.btnUser.setTitle(ShowResultVC.pick_user , for: .normal)
            self.btnStatus.setTitle(ShowResultVC.pick_status, for: .normal)
            //self.txtBandStatus.text = "\(ShowResultVC.pick_progId)"
            //  self.pickProg.selectedRow(inComponent: ShowResultVC.pick_prog)
            
            
            //  self.pickProg.reloadAllComponents()
            API.filter()
            
            
            self.progId = self.pickedData["programId"] as? Int ?? 0
            self.typId = self.pickedData["typeId"] as? Int ?? 0
            self.priorId = self.pickedData["periorityId"] as? Int ?? 0
            self.statId = self.pickedData["statusId"] as? Int ?? 0
            self.useId = self.pickedData["userId"] as? Int ?? 0
            let latItm = FilterVC.LateBand
            let hidItem = FilterVC.hidenBnd
            
            API.show(creator: "0", item: "0", pgIndex: "1", pgsize: "25", asignTo: "\(self.useId)", status: "\(self.statId)", periority: "\(self.priorId)", program: "\(self.progId)", type: "\(self.typId)", user: "0", lateItem: latItm, HideClosed: hidItem, catid: "4") { (error:Error?,success:Bool,data:AnyObject?) in
                
                if success {
                    let r = Search(fromDictionary: data as! [String : Any])
                    self.searchWorkItemsResult = r.searchWorkItemsResult
                    
                    print("filll")
                }
                else {return}
            }
        }
    }
//    override func viewWillAppear(_ animated: Bool) {
//        // get data from previos screen
//        DispatchQueue.main.async {
//            self.pickProg.dataSource = self
//            self.pickProg.delegate = self
//
//            self.txtBandAdd.text = ShowResultVC.text_Band_add
//            self.btnSpec.setTitle(ShowResultVC.text_Band_date, for: .normal)
//            self.txtBandDat.text = ShowResultVC.text_Band_date
//            self.txtVBandDetail.text = ShowResultVC.text_Band_detail
//            self.txtBandStatus.text = ShowResultVC.text_Status
//          //  self.pickProg.selectedRow(inComponent: ShowResultVC.pick_prog)
//
//
//          //  self.pickProg.reloadAllComponents()
//            API.filter()
//
//
//                let progId = self.pickedData["programId"] as? Int
//                let typId = self.pickedData["typeId"] as? Int
//                let priorId = self.pickedData["periorityId"] as? Int
//                let statId = self.pickedData["statusId"] as? Int
//                let useId = self.pickedData["userId"] as? Int
//                API.show(creator: "0", item: "0", pgIndex: "1", pgsize: "25", asignTo: "\(useId!)", status: "\(statId!)", periority: "\(priorId!)", program: "\(progId!)", type: "\(typId!)", user: "0", lateItem: "0") { (error:Error?,success:Bool,data:AnyObject?) in
//
//                    if success {
//                        let r = Search(fromDictionary: data as! [String : Any])
//                        self.searchWorkItemsResult = r.searchWorkItemsResult
//                      //  txtBandNo.text = searchWorkItemsResult[IndexPath.row]
//                       // txtBandNo.text = self.searchWorkItemsResult[0].workItemId
////                        self.txtBandAdd.text = self.searchWorkItemsResult[0].workItemTitle
////                        self.txtBandDat.text = self.searchWorkItemsResult[1].workItemCreatedDate
//
//                        print("filll")
//                    }
//                    else {return}
//                }
//        }
////        // txtBandNo.text = self.searchWorkItemsResult[""]
////
//    }
    
    
    func reloadPickerViews(){
        
        self.pickProg.selectedRow(inComponent: 0)
        self.pickType.selectedRow(inComponent: 0)
        self.pickPerior.selectedRow(inComponent: 0)
        self.pickRespons.selectedRow(inComponent: 0)
        self.pickStatus.selectedRow(inComponent: 0)
        pickerviewData["programId"] = resultt?.filterIOSResult?.itemPrograms?[0].workItemProgramId
        pickerviewData["typeId"] = resultt?.filterIOSResult?.itemtype?[0].workItemTypeId
        pickerviewData["periorityId"] = resultt?.filterIOSResult?.itemPriorities?[0].workItemPriorityId
        pickerviewData["userId"] = resultt?.filterIOSResult?.itemusers?[0].userId
        pickerviewData["statusId"] = resultt?.filterIOSResult?.status?[0].workItemStatusId
        
        self.pickProg.reloadAllComponents()
        self.pickType.reloadAllComponents()
        self.pickPerior.reloadAllComponents()
        self.pickRespons.reloadAllComponents()
        self.pickStatus.reloadAllComponents()
    }
    
    @IBAction func btnSav(_ sender: UIButton) {
        
        guard let bandId = txtBandNo.text , !bandId.isEmpty else {return}
        let titlee = txtBandAdd.text ?? " "
        let detaill = txtVBandDetail.text ?? " "
        let creator = txtBandStatus.text ?? " "
       // print ("\(bandId)", titlee,detaill,creator, "\(responderId)","\(statusId)","\(periorrId)", "\(endDate)","\(progId)","\(typpId)")
//        if (btnDelv.title(for: .normal) == "Date")
//        {
//            endDate = nil
//        }
 //       else { endDate = btnDelv.title(for: .normal)!}
       // guard let endDat = btnDelv.title(for: .normal)
        let progId = progammId ?? ShowResultVC.pick_progId
        let typId = typpId ?? ShowResultVC.pick_typId
        let priorId = periorrId ?? ShowResultVC.pick_priorId
        let userId = responderId ?? ShowResultVC.pick_userId
        let statussId = statusId ?? ShowResultVC.pick_statusId
         print ("\(bandId)", titlee,detaill,creator, "\(userId)","\(statussId)","\(priorId)", "\(endDate)","\(progId)","\(typId)")
        startLoading()
        API.editBand(itemId: "\(bandId)", title: titlee, detail: detaill, creator: creator, assignTo: "\(userId)", status: "\(statussId)", periority: "\(priorId)", endDate: "\(endDate)", program: "\(progId)",type: "\(typId)", catId: "4")
        
        { (error:Error?, success:Bool?, data:AnyObject?) in
            self.stopLoading()
            self.showAlert("تم اضافه البند بنجاح","تم بنجاح")

            print(error as Any, "       " , "       " , success as Any , "       " , data as Any )
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1
    }
    //selectedRow
    
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
        else if (pickerView.tag == 5){
            return (resultt?.filterIOSResult?.status.count) ?? 0
        }
            
        else { return 0}
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       // let selectedData = pickerView.selectedRow(inComponent: 0)
        if (pickerView.tag == 1){
            pickProg.isHidden = true
         //   pickerviewData["prog"] = selectedData
           // pickerviewData["progId"] =
            progammId = resultt?.filterIOSResult?.itemPrograms[row].workItemProgramId //?? ShowResultVC.pick_progId
           let programm = resultt?.filterIOSResult?.itemPrograms[row].workItemProgram
            print(programm!)
            print ("\(progammId!)")
            btnProg.setTitle(programm, for: .normal)
            btnProg.isHidden = false
        }
        if (pickerView.tag == 2){
            pickType.isHidden = true
            //pickerviewData["typeId"]
            typpId = resultt?.filterIOSResult?.itemtype[row].workItemTypeId //?? ShowResultVC.pick_typId
            let typp = resultt?.filterIOSResult?.itemtype[row].workItemType
            btnTyp.setTitle(typp, for: .normal)
            btnTyp.isHidden = false
        }
        if (pickerView.tag == 3){
            pickPerior.isHidden = true
           // pickerviewData["periorityId"]
            periorrId = resultt?.filterIOSResult?.itemPriorities[row].workItemPriorityId //?? ShowResultVC.pick_priorId
            let periorr = resultt?.filterIOSResult?.itemPriorities[row].workItemPriority
            btnPrior.setTitle(periorr, for: .normal)
            btnPrior.isHidden = false
        }
        if (pickerView.tag == 4){
            pickRespons.isHidden = true
           // pickerviewData["userId"]
            responderId = resultt?.filterIOSResult?.itemPriorities[row].workItemPriorityId //?? ShowResultVC.pick_userId
            let responder = resultt?.filterIOSResult?.itemusers[row].userName
            btnUser.setTitle(responder, for: .normal)
            btnUser.isHidden = false
        }
        if (pickerView.tag == 5){
            pickStatus.isHidden = true
            //pickerviewData["statusId"]
            statusId = resultt?.filterIOSResult?.status[row].workItemStatusId //?? ShowResultVC.pick_statusId
            let status = resultt?.filterIOSResult?.status[row].workItemStatuS
            btnStatus.setTitle(status, for: .normal)
            btnStatus.isHidden = false
        }
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
            else if (pickerView.tag == 5)
        {
            return resultt?.filterIOSResult?.status?[row].workItemStatuS ?? ""
        }
            
        else {return ""}
    }
    
    
    
}
