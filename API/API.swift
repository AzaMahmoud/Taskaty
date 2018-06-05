//
//  API.swift
//  Taskatyy
//
//  Created by zoza on 15/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {
    
    class func login(user: String, pass: String, completion: @escaping (_ error:Error?, _ success:Bool)->Void)
    {
        
        let url = URLs.Login
        let parameters = ["userName":user, "password":pass]
        let header = ["Content-Type" : "application/json"]
        Alamofire.request(url, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header)
            .responseJSON { response in
                if response.result.isSuccess{
                    // let log = JSON(response.result.value)
                    print ("Login succeeded")
                    // print(log)
                    completion(nil,true)
                    
                }
                else {
                    print ("Error\(response.result.error!)")
                    
                }
                //  print(response)
        }
    }
    
    
    
    class func filter()
    {
        let url = URLs.Filter
        Alamofire.request(url, method: .get, headers: nil)
            .responseJSON { response in
                
                if response.result.isSuccess{
                    _ = JSON(response.result.value!)
                }
                else {
                    print ("Error\(String(describing: response.result.error))")
                }
        }
    }
    
    
    
    class func filter2()
    {
        let url = URLs.Filter2
        Alamofire.request(url, method: .get, headers: nil)
            .responseJSON { response in
                
                if response.result.isSuccess{
                    _ = JSON(response.result.value!)
                }
                else {
                    print ("Error\(String(describing: response.result.error))")
                }
        }
    }
    
    
    
    class func show(creator: String, item: String, pgIndex: String, pgsize: String, asignTo: String, status: String, periority: String, program: String, type:String, user: String, lateItem: String , completion: @escaping (_ error:Error?, _ success:Bool ,_ data:AnyObject?)
        ->Void)
    {
        let url = URLs.Show
        let parameters = ["workItemCreatedBy":creator, "workItemId":item, "pageIndex":pgIndex, "pageSize":pgsize, "workItemAssignedTo":asignTo, "workItemStatusId":status, "workItemPriorityId":periority, "workItemProgramId":program, "workItemTypeId":type, "userId":user, "lateItems":lateItem] as [String:AnyObject]
        
        let header = ["Content-Type" : "application/json"]
        Alamofire.request(url, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header)
            .responseJSON { response in
                switch response.result {
                case .success (let value):
                    completion(nil,true,value as AnyObject?)
                case .failure(let error):
                    
                    completion(error as NSError?,false,nil)
                }
                
        }
    }
    
    
    
    
    class func addBnd(creator: String, status: String, title: String, detail: String, assignTo: String, periority: String, date: String, progrm: String, type: String, photos: [String:Any] , completion: @escaping (_ error:Error?, _ success:Bool ,_ data:AnyObject?)->Void)
    {
        let url = URLs.AddBand
        let parameters = ["WorkItemCreatedBy":creator, "WorkItemStatusId":status, "WorkItemTitle":title, "WorkItemDetails":detail, "WorkItemAssignedTo":assignTo, "WorkItemPriorityId":periority, "AssignDate":date, "WorkItemProgramId":progrm, "WorkItemTypeId":type, "photos":photos] as [String:AnyObject]
        
        let header = ["Content-Type" : "application/json"]
        Alamofire.request(url, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header)
            .responseJSON { response in
                switch response.result {
                case .success (let value):
                    completion(nil,true,value as AnyObject?)
                case .failure(let error):
                    
                    completion(error as NSError?,false,nil)
                }
                
        }
    }

}
