//
//	ItemProgram.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ItemProgram : NSObject, NSCoding{

	var workItemProgram : String!
	var workItemProgramId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		workItemProgram = dictionary["WorkItemProgram"] as? String
		workItemProgramId = dictionary["WorkItemProgramId"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if workItemProgram != nil{
			dictionary["WorkItemProgram"] = workItemProgram
		}
		if workItemProgramId != nil{
			dictionary["WorkItemProgramId"] = workItemProgramId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         workItemProgram = aDecoder.decodeObject(forKey: "WorkItemProgram") as? String
         workItemProgramId = aDecoder.decodeObject(forKey: "WorkItemProgramId") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if workItemProgram != nil{
			aCoder.encode(workItemProgram, forKey: "WorkItemProgram")
		}
		if workItemProgramId != nil{
			aCoder.encode(workItemProgramId, forKey: "WorkItemProgramId")
		}

	}

}