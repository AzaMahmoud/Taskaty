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

class addItemVC: UIViewController//, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet weak var bndTitlTxt: UITextField!
    @IBOutlet weak var pickProg: UIPickerView!
    @IBOutlet weak var pickTyp: UIPickerView!
    @IBOutlet weak var bndDetTxtV: UITextView!
    @IBOutlet weak var pickPerior: UIPickerView!
    @IBOutlet weak var pickFor: UIPickerView!
    @IBOutlet weak var pickDat: UIDatePicker!
    
    var pickerviewData : [String : Any] = [:]

//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        <#code#>
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        <#code#>
//    }
    
    var resultt : filterGen?
    override func viewDidLoad() {
        API.filter2()
        super.viewDidLoad()
//        pickProg.delegate = self
//        pickProg.dataSource = self
//        pickTyp.delegate = self
//        pickTyp.dataSource = self
//        pickPerior.delegate = self
//        pickPerior.dataSource = self
//        pickFor.delegate = self
//        pickFor.dataSource = self

    }
    
    @IBAction func addImgBtn(_ sender: UIButton) {
    }
    
    @IBAction func savBtn(_ sender: UIButton) {
    }
    
}
