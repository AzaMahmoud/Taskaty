//
//  User.swift
//  Taskatyy
//
//  Created by zoza on 06/08/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import Foundation
import SwiftyJSON


class User: NSObject , NSCoding {
    
    
    var id: Int?
    
    init(_ data: JSON) {
        self.id = data["Id"].int
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "Id")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "Id") as? Int
    }
    
    
    
    
}
