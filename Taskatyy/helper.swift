//
//  helper.swift
//  Taskatyy
//
//  Created by zoza on 15/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit

class helper: NSObject {
    
    class func sucess()-> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "userName") as? String
    }

}
