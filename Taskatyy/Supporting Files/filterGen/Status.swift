//
//	Status.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Status : NSObject, NSCoding{

	var workItemStatuS : String!
	var workItemStatusId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		workItemStatuS = dictionary["WorkItemStatuS"] as? String
		workItemStatusId = dictionary["WorkItemStatusId"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if workItemStatuS != nil{
			dictionary["WorkItemStatuS"] = workItemStatuS
		}
		if workItemStatusId != nil{
			dictionary["WorkItemStatusId"] = workItemStatusId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         workItemStatuS = aDecoder.decodeObject(forKey: "WorkItemStatuS") as? String
         workItemStatusId = aDecoder.decodeObject(forKey: "WorkItemStatusId") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if workItemStatuS != nil{
			aCoder.encode(workItemStatuS, forKey: "WorkItemStatuS")
		}
		if workItemStatusId != nil{
			aCoder.encode(workItemStatusId, forKey: "WorkItemStatusId")
		}

	}

}