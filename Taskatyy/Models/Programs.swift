//
//  ItemPrograms.swift
//  Taskatyy
//
//  Created by zoza on 21/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import Foundation

class Programs {
    var id: Int?
    var name: String?
    
    init(withData data: [String: Any]) {
        if let id = data["WorkItemProgramId"] as? Int ,
        let name = data["WorkItemProgram"] as? String
        {
            self.id = id
            self.name = name
        }
    }
    
    class func parsePrograms (fromData data: [String:Any]) -> [Programs]
    {
        var prog = [Programs]()
        if let program = ["ItemPrograms"] as? [[String:Any]]
        {
            for programData in program{
                prog.append(Programs(withData: programData))
            }
        }
        return prog
    }
}
