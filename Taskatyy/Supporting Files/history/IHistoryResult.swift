//
//	IHistoryResult.swift
//
//	Create by Zoz on 29/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class IHistoryResult : NSObject, NSCoding{

	var notes : String!
	var operationCreatedDate : String!
	var userName : String!
	var workItemOperation : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		notes = dictionary["Notes"] as? String
		operationCreatedDate = dictionary["OperationCreatedDate"] as? String
		userName = dictionary["UserName"] as? String
		workItemOperation = dictionary["WorkItemOperation"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if notes != nil{
			dictionary["Notes"] = notes
		}
		if operationCreatedDate != nil{
			dictionary["OperationCreatedDate"] = operationCreatedDate
		}
		if userName != nil{
			dictionary["UserName"] = userName
		}
		if workItemOperation != nil{
			dictionary["WorkItemOperation"] = workItemOperation
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         notes = aDecoder.decodeObject(forKey: "Notes") as? String
         operationCreatedDate = aDecoder.decodeObject(forKey: "OperationCreatedDate") as? String
         userName = aDecoder.decodeObject(forKey: "UserName") as? String
         workItemOperation = aDecoder.decodeObject(forKey: "WorkItemOperation") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if notes != nil{
			aCoder.encode(notes, forKey: "Notes")
		}
		if operationCreatedDate != nil{
			aCoder.encode(operationCreatedDate, forKey: "OperationCreatedDate")
		}
		if userName != nil{
			aCoder.encode(userName, forKey: "UserName")
		}
		if workItemOperation != nil{
			aCoder.encode(workItemOperation, forKey: "WorkItemOperation")
		}

	}

}
