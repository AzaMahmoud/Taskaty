//
//  Config.swift
//  Taskatyy
//
//  Created by zoza on 15/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import Foundation

struct URLs {
    // POST , params : "userName", "password"
    static let Login = "http://167.114.174.82:1717/TaskatyService.svc/Login"
    
    //GET
    static let Filter = "http://167.114.174.82:16016/taskatyservice.svc/filterIOS"
    
    // POST , params :
    //consts: "workItemCreatedBy":"0","workItemId":"0","pageIndex":"1","pageSize":"25","userId":"0","lateItems":"0"
    // var: "workItemAssignedTo":"0","workItemStatusId":"0","workItemPriorityId":"0","workItemProgramId":"0","workItemTypeId":"1"
    static let Show = "http://167.114.174.82:16016/taskatyservice.svc/SearchWorkItems"
}
