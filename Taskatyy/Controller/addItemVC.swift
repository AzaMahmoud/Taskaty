//
//  addItemVC.swift
//  Taskatyy
//
//  Created by zoza on 23/05/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class addItemVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var bndTitlTxt: UITextField!
    @IBOutlet weak var pickProg: UIPickerView!
    @IBOutlet weak var pickTyp: UIPickerView!
    @IBOutlet weak var bndDetTxtV: UITextView!
    @IBOutlet weak var pickPerior: UIPickerView!
    @IBOutlet weak var pickFor: UIPickerView!
    @IBOutlet weak var datBtn: UIButton!
    
    @IBOutlet weak var uiImge: UIImageView!
    @IBAction func datPick(_ sender: UIButton) {
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

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag==1)
        {
            return (resultt?.filterIOSResult?.itemPrograms?.count) ?? 0
        }
        else if (pickerView.tag==2)
        {
            return (resultt?.filterIOSResult?.itemtype?.count) ?? 0
        }
        else if (pickerView.tag==3)
        {
            return (resultt?.filterIOSResult?.itemPriorities?.count) ?? 0
        }
        else if (pickerView.tag==4)
        {
            return (resultt?.filterIOSResult?.itemusers?.count) ?? 0
        }
        else { return 0 }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag==1){
            return (resultt?.filterIOSResult?.itemPrograms?[row].workItemProgram ?? "")
        }
        else if (pickerView.tag==2){
        return (resultt?.filterIOSResult?.itemtype?[row].workItemType ?? "")
        }
        else if (pickerView.tag==3){
            return (resultt?.filterIOSResult?.itemPriorities?[row].workItemPriority ?? "")
        }
        else if (pickerView.tag==4){
            return (resultt?.filterIOSResult?.itemusers?[row].userName ?? "")
        }
        else {return ""}
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedData = pickerView.selectedRow(inComponent: 0)
        if (pickerView.tag==1){
            pickerviewData["program"] = selectedData
            pickerviewData["programId"] = resultt?.filterIOSResult?.itemPrograms?[row].workItemProgramId
            print(pickerviewData["program"]!)
            print(resultt?.filterIOSResult?.itemPrograms?[row].workItemProgramId ?? 0)
        }
        if (pickerView.tag==2){
            pickerviewData["type"] = selectedData
            pickerviewData["typeId"] = resultt?.filterIOSResult?.itemtype?[row].workItemTypeId
            print(pickerviewData["type"]!)
            print(resultt?.filterIOSResult?.itemtype?[row].workItemTypeId ?? 0)
        }
        if (pickerView.tag==3){
            pickerviewData["periority"] = selectedData
            pickerviewData["periorityId"] = resultt?.filterIOSResult?.itemPriorities[row].workItemPriorityId
            print(pickerviewData["periority"]!)
            print(resultt?.filterIOSResult?.itemPriorities?[row].workItemPriorityId ?? 0)
        }
        if (pickerView.tag==4){
            pickerviewData["user"] = selectedData
            pickerviewData["userId"] = resultt?.filterIOSResult?.itemusers[row].userId
            print(pickerviewData["user"]!)
            print(resultt?.filterIOSResult?.itemusers?[row].userId ?? 0)
        }
    }
    
    var resultt : Filter?
    override func viewDidLoad() {
        API.filter()
        super.viewDidLoad()
        pickProg.delegate = self
        pickProg.dataSource = self
        pickTyp.delegate = self
        pickTyp.dataSource = self
        pickPerior.delegate = self
        pickPerior.dataSource = self
        pickFor.delegate = self
        pickFor.dataSource = self
        
        let url = URLs.Filter
        Alamofire.request(url, method: .get, headers: nil)
            .responseJSON {
                response in
                switch response.result
                {
                case .failure(let error):
                    print (error)
                case .success( _):
                    let dic = response.result.value as! [String:Any]
                    self.resultt = Filter(fromDictionary: dic)
                    self.reloadPickerView()
                }
        }
        
    }
    
    func reloadPickerView() {
        self.pickProg.reloadAllComponents()
        self.pickTyp.reloadAllComponents()
        self.pickPerior.reloadAllComponents()
        self.pickFor.reloadAllComponents()
        pickerviewData["userId"] = resultt?.filterIOSResult?.itemusers?[0].userId
    }
    var pickedImage: UIImage? {
        didSet {
            guard let pic = pickedImage else {return}
            self.imagess.append(pic)
            self.uiImge.image = pic
        }}
    
    var imagess = [UIImage]()
    var Myimage: [String: Any] = [:]

    
    @IBAction func addImgBtn(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @objc public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        
        
       
        if let originImg = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.pickedImage = originImg
            //    submit(image: image)
       // let imageData = UIImagePNGRepresentation(editedImg)!
        //imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
//            guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
            //Convert Image to Data
            //guard
                let imageDataa = UIImageJPEGRepresentation(originImg, 0.8) //else { return }
            let imageData = imageDataa?.base64EncodedString()
            //Set Image Name
            let imageName =
            "\(Int(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
            // MARK: To Do - Add Iamge Name and data to Dictionary//
            
            Myimage = [
                "photoasBase64" : "\(imageData!)",
                "photoName" :"\(imageName)"
                ]
//            Myimage = [
//                "photoasBase64" : imageData,
//                "photoName" :imageName
//            ]
            
           // print(imageData)
          //  ProfileImage.image = UIImage(data: imageName)
        //print (imageData)
        
        }
            
//        else if let originImg = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            self.pickedImage = originImg
//            //  submit(image: image)
//        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func savBtn(_ sender: UIButton) {
        let progId = pickerviewData["programId"] as? Int ?? 0
        let typId = pickerviewData["typeId"] as? Int ?? 0
        let priorId = pickerviewData["periorityId"] as? Int ?? 0
        let userId = pickerviewData["userId"] as? Int ?? 0
        guard let titl = bndTitlTxt.text, !titl.isEmpty else {return}
        guard let detail = bndDetTxtV.text, !detail.isEmpty else {return}
        let dat = datBtn.title(for: .normal)
        
        print(progId)
        print(typId)
        print(priorId)
        print(userId)
        print(titl)
        print(detail)
        print(dat!)
       // print(self.Myimage)

        
        DispatchQueue.main.async {
        API.addBnd(creator: "2", status: "1", title: titl, detail: detail, assignTo: "\(userId)", periority: "\(priorId)", date: "\(dat!)", progrm: "\(progId)", type: "\(typId)", photos: self.Myimage) { (error:Error?, success:Bool?, data:AnyObject?) in
            //if sucess { print("work Added")} else {return}
            print(error as Any, "       " , "       " , success as Any , "       " , data as Any )
        }
    
    }
    }
    
}
