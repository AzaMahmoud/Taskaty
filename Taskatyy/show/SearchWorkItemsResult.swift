//
//	SearchWorkItemsResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class SearchWorkItemsResult : NSObject, NSCoding{

	var assignDate : String!
	var endDate : AnyObject!
	var serial : Int!
	var userAssigned : String!
	var userCreated : String!
	var workItemAssignedTo : Int!
	var workItemCreatedBy : Int!
	var workItemCreatedDate : String!
	var workItemDetails : String!
	var workItemId : Int!
	var workItemPriority : String!
	var workItemPriorityId : Int!
	var workItemProgram : String!
	var workItemProgramId : Int!
	var workItemStatus : String!
	var workItemStatusId : Int!
	var workItemTitle : String!
	var workItemType : AnyObject!
	var workItemTypeId : AnyObject!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		assignDate = dictionary["AssignDate"] as? String
		endDate = dictionary["EndDate"] as? AnyObject
		serial = dictionary["Serial"] as? Int
		userAssigned = dictionary["UserAssigned"] as? String
		userCreated = dictionary["UserCreated"] as? String
		workItemAssignedTo = dictionary["WorkItemAssignedTo"] as? Int
		workItemCreatedBy = dictionary["WorkItemCreatedBy"] as? Int
		workItemCreatedDate = dictionary["WorkItemCreatedDate"] as? String
		workItemDetails = dictionary["WorkItemDetails"] as? String
		workItemId = dictionary["WorkItemId"] as? Int
		workItemPriority = dictionary["WorkItemPriority"] as? String
		workItemPriorityId = dictionary["WorkItemPriorityId"] as? Int
		workItemProgram = dictionary["WorkItemProgram"] as? String
		workItemProgramId = dictionary["WorkItemProgramId"] as? Int
		workItemStatus = dictionary["WorkItemStatus"] as? String
		workItemStatusId = dictionary["WorkItemStatusId"] as? Int
		workItemTitle = dictionary["WorkItemTitle"] as? String
		workItemType = dictionary["WorkItemType"] as? AnyObject
		workItemTypeId = dictionary["WorkItemTypeId"] as? AnyObject
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if assignDate != nil{
			dictionary["AssignDate"] = assignDate
		}
		if endDate != nil{
			dictionary["EndDate"] = endDate
		}
		if serial != nil{
			dictionary["Serial"] = serial
		}
		if userAssigned != nil{
			dictionary["UserAssigned"] = userAssigned
		}
		if userCreated != nil{
			dictionary["UserCreated"] = userCreated
		}
		if workItemAssignedTo != nil{
			dictionary["WorkItemAssignedTo"] = workItemAssignedTo
		}
		if workItemCreatedBy != nil{
			dictionary["WorkItemCreatedBy"] = workItemCreatedBy
		}
		if workItemCreatedDate != nil{
			dictionary["WorkItemCreatedDate"] = workItemCreatedDate
		}
		if workItemDetails != nil{
			dictionary["WorkItemDetails"] = workItemDetails
		}
		if workItemId != nil{
			dictionary["WorkItemId"] = workItemId
		}
		if workItemPriority != nil{
			dictionary["WorkItemPriority"] = workItemPriority
		}
		if workItemPriorityId != nil{
			dictionary["WorkItemPriorityId"] = workItemPriorityId
		}
		if workItemProgram != nil{
			dictionary["WorkItemProgram"] = workItemProgram
		}
		if workItemProgramId != nil{
			dictionary["WorkItemProgramId"] = workItemProgramId
		}
		if workItemStatus != nil{
			dictionary["WorkItemStatus"] = workItemStatus
		}
		if workItemStatusId != nil{
			dictionary["WorkItemStatusId"] = workItemStatusId
		}
		if workItemTitle != nil{
			dictionary["WorkItemTitle"] = workItemTitle
		}
		if workItemType != nil{
			dictionary["WorkItemType"] = workItemType
		}
		if workItemTypeId != nil{
			dictionary["WorkItemTypeId"] = workItemTypeId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         assignDate = aDecoder.decodeObject(forKey: "AssignDate") as? String
         endDate = aDecoder.decodeObject(forKey: "EndDate") as? AnyObject
         serial = aDecoder.decodeObject(forKey: "Serial") as? Int
         userAssigned = aDecoder.decodeObject(forKey: "UserAssigned") as? String
         userCreated = aDecoder.decodeObject(forKey: "UserCreated") as? String
         workItemAssignedTo = aDecoder.decodeObject(forKey: "WorkItemAssignedTo") as? Int
         workItemCreatedBy = aDecoder.decodeObject(forKey: "WorkItemCreatedBy") as? Int
         workItemCreatedDate = aDecoder.decodeObject(forKey: "WorkItemCreatedDate") as? String
         workItemDetails = aDecoder.decodeObject(forKey: "WorkItemDetails") as? String
         workItemId = aDecoder.decodeObject(forKey: "WorkItemId") as? Int
         workItemPriority = aDecoder.decodeObject(forKey: "WorkItemPriority") as? String
         workItemPriorityId = aDecoder.decodeObject(forKey: "WorkItemPriorityId") as? Int
         workItemProgram = aDecoder.decodeObject(forKey: "WorkItemProgram") as? String
         workItemProgramId = aDecoder.decodeObject(forKey: "WorkItemProgramId") as? Int
         workItemStatus = aDecoder.decodeObject(forKey: "WorkItemStatus") as? String
         workItemStatusId = aDecoder.decodeObject(forKey: "WorkItemStatusId") as? Int
         workItemTitle = aDecoder.decodeObject(forKey: "WorkItemTitle") as? String
         workItemType = aDecoder.decodeObject(forKey: "WorkItemType") as? AnyObject
         workItemTypeId = aDecoder.decodeObject(forKey: "WorkItemTypeId") as? AnyObject

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if assignDate != nil{
			aCoder.encode(assignDate, forKey: "AssignDate")
		}
		if endDate != nil{
			aCoder.encode(endDate, forKey: "EndDate")
		}
		if serial != nil{
			aCoder.encode(serial, forKey: "Serial")
		}
		if userAssigned != nil{
			aCoder.encode(userAssigned, forKey: "UserAssigned")
		}
		if userCreated != nil{
			aCoder.encode(userCreated, forKey: "UserCreated")
		}
		if workItemAssignedTo != nil{
			aCoder.encode(workItemAssignedTo, forKey: "WorkItemAssignedTo")
		}
		if workItemCreatedBy != nil{
			aCoder.encode(workItemCreatedBy, forKey: "WorkItemCreatedBy")
		}
		if workItemCreatedDate != nil{
			aCoder.encode(workItemCreatedDate, forKey: "WorkItemCreatedDate")
		}
		if workItemDetails != nil{
			aCoder.encode(workItemDetails, forKey: "WorkItemDetails")
		}
		if workItemId != nil{
			aCoder.encode(workItemId, forKey: "WorkItemId")
		}
		if workItemPriority != nil{
			aCoder.encode(workItemPriority, forKey: "WorkItemPriority")
		}
		if workItemPriorityId != nil{
			aCoder.encode(workItemPriorityId, forKey: "WorkItemPriorityId")
		}
		if workItemProgram != nil{
			aCoder.encode(workItemProgram, forKey: "WorkItemProgram")
		}
		if workItemProgramId != nil{
			aCoder.encode(workItemProgramId, forKey: "WorkItemProgramId")
		}
		if workItemStatus != nil{
			aCoder.encode(workItemStatus, forKey: "WorkItemStatus")
		}
		if workItemStatusId != nil{
			aCoder.encode(workItemStatusId, forKey: "WorkItemStatusId")
		}
		if workItemTitle != nil{
			aCoder.encode(workItemTitle, forKey: "WorkItemTitle")
		}
		if workItemType != nil{
			aCoder.encode(workItemType, forKey: "WorkItemType")
		}
		if workItemTypeId != nil{
			aCoder.encode(workItemTypeId, forKey: "WorkItemTypeId")
		}

	}

}