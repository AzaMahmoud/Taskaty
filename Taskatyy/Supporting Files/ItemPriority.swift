//
//	ItemPriority.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ItemPriority : NSObject, NSCoding{

	var workItemPriority : String!
	var workItemPriorityId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		workItemPriority = dictionary["WorkItemPriority"] as? String
		workItemPriorityId = dictionary["WorkItemPriorityId"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if workItemPriority != nil{
			dictionary["WorkItemPriority"] = workItemPriority
		}
		if workItemPriorityId != nil{
			dictionary["WorkItemPriorityId"] = workItemPriorityId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         workItemPriority = aDecoder.decodeObject(forKey: "WorkItemPriority") as? String
         workItemPriorityId = aDecoder.decodeObject(forKey: "WorkItemPriorityId") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if workItemPriority != nil{
			aCoder.encode(workItemPriority, forKey: "WorkItemPriority")
		}
		if workItemPriorityId != nil{
			aCoder.encode(workItemPriorityId, forKey: "WorkItemPriorityId")
		}

	}

}