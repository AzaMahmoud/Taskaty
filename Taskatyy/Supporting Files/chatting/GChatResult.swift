//
//	GChatResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class GChatResult : NSObject, NSCoding{

	var chatMessage : String!
	var name : AnyObject!
	var recordDate : String!
	var userId : Int!
	var userName : String!
	var wICID : Int!
	var workItemId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		chatMessage = dictionary["ChatMessage"] as? String
		name = dictionary["Name"] as? AnyObject
		recordDate = dictionary["RecordDate"] as? String
		userId = dictionary["UserId"] as? Int
		userName = dictionary["UserName"] as? String
		wICID = dictionary["WICID"] as? Int
		workItemId = dictionary["WorkItemId"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if chatMessage != nil{
			dictionary["ChatMessage"] = chatMessage
		}
		if name != nil{
			dictionary["Name"] = name
		}
		if recordDate != nil{
			dictionary["RecordDate"] = recordDate
		}
		if userId != nil{
			dictionary["UserId"] = userId
		}
		if userName != nil{
			dictionary["UserName"] = userName
		}
		if wICID != nil{
			dictionary["WICID"] = wICID
		}
		if workItemId != nil{
			dictionary["WorkItemId"] = workItemId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         chatMessage = aDecoder.decodeObject(forKey: "ChatMessage") as? String
         name = aDecoder.decodeObject(forKey: "Name") as? AnyObject
         recordDate = aDecoder.decodeObject(forKey: "RecordDate") as? String
         userId = aDecoder.decodeObject(forKey: "UserId") as? Int
         userName = aDecoder.decodeObject(forKey: "UserName") as? String
         wICID = aDecoder.decodeObject(forKey: "WICID") as? Int
         workItemId = aDecoder.decodeObject(forKey: "WorkItemId") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if chatMessage != nil{
			aCoder.encode(chatMessage, forKey: "ChatMessage")
		}
		if name != nil{
			aCoder.encode(name, forKey: "Name")
		}
		if recordDate != nil{
			aCoder.encode(recordDate, forKey: "RecordDate")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "UserId")
		}
		if userName != nil{
			aCoder.encode(userName, forKey: "UserName")
		}
		if wICID != nil{
			aCoder.encode(wICID, forKey: "WICID")
		}
		if workItemId != nil{
			aCoder.encode(workItemId, forKey: "WorkItemId")
		}

	}

}