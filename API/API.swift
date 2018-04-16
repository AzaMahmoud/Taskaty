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
        Alamofire.request(url, method: .post, parameters: parameters, headers: header)
            .responseString { response in
                if response.result.isSuccess{
                    print ("Login succeeded")
                    completion(nil,true)
                    
                }
                else {
                    print ("Error\(response.result.error)")
                    
                }
                print(response)
        }
    }
    
    class func filter()
    {
        let url = URLs.Filer
        Alamofire.request(url, method: .get, headers: nil)
            .responseJSON { response in
                if response.result.isSuccess {
                    print("Great")
                    
                }
                else{
                    print("Error\(response.result.error)")
                }
                print(response)
        }
    }
    
    
    
    
    
    
    
}
