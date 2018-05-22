//
//	Itemtype.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Itemtype : NSObject, NSCoding{

	var workItemType : String!
	var workItemTypeId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		workItemType = dictionary["WorkItemType"] as? String
		workItemTypeId = dictionary["WorkItemTypeId"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
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
         workItemType = aDecoder.decodeObject(forKey: "WorkItemType") as? String
         workItemTypeId = aDecoder.decodeObject(forKey: "WorkItemTypeId") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if workItemType != nil{
			aCoder.encode(workItemType, forKey: "WorkItemType")
		}
		if workItemTypeId != nil{
			aCoder.encode(workItemTypeId, forKey: "WorkItemTypeId")
		}

	}

}