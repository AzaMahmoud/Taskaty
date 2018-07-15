//
//  Config.swift
//  Taskatyy
//
//  Created by zoza on 15/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import Foundation

struct URLs {
    //(LOG IN)  POST , params : "userName", "password"
    static let Login = "http://167.114.174.82:1717/TaskatyService.svc/Login"
    
    //(SEARCH)     GET
    static let Filter = "http://167.114.174.82:16016/taskatyservice.svc/filterIOS"
    // GET
    // To load without 'الكل'
    static let Filter2 = "http://167.114.174.82:16016/taskatyservice.svc/filter"
    //(SHOW DETAILS)
    // POST , params :
    //consts: "workItemCreatedBy":"0","workItemId":"0","pageIndex":"1","pageSize":"25","userId":"0","lateItems":"0"
    // var: "workItemAssignedTo":"0","workItemStatusId":"0","workItemPriorityId":"0","workItemProgramId":"0","workItemTypeId":"1"
    static let Show = "http://167.114.174.82:16016/taskatyservice.svc/SearchWorkItems"


    //(ADD BAND)
    //POST, PARAMS :
    //constants : "WorkItemCreatedBy":"2","WorkItemStatusId":"1"
    //var: "WorkItemTitle":"jh",WorkItemDetails":"ttttttttttttttttttttttttt","WorkItemAssignedTo":"0","WorkItemPriorityId":"2","AssignDate":"9-5-2018","WorkItemProgramId":"1","WorkItemTypeId":"1","photos":[{"photoasBase64" : "","photoName": "qq" }]
 

    static let AddBand = "http://167.114.174.82:16016/taskatyservice.svc/Addwork"

    
    // (EDIT BAND)
    // POST, params:
    // var: "workItemId":"1131","WorkItemTitle":"jh","WorkItemDetails":"ttttttttttttttttttttttttt","WorkItemCreatedBy":"2","WorkItemAssignedTo":"0","WorkItemStatusId":"1","WorkItemPriorityId":"2","EndDate":"4-8-2018","WorkItemProgramId":"1","WorkItemTypeId":"1"
    
    static let EditBand = "http://167.114.174.82:16016/taskatyservice.svc/updateitm"
    


}



