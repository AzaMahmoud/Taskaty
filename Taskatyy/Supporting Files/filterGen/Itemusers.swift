//
//	Itemusers.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Itemusers : NSObject, NSCoding{

	var userId : Int!
	var userName : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		userId = dictionary["UserId"] as? Int
		userName = dictionary["UserName"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if userId != nil{
			dictionary["UserId"] = userId
		}
		if userName != nil{
			dictionary["UserName"] = userName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         userId = aDecoder.decodeObject(forKey: "UserId") as? Int
         userName = aDecoder.decodeObject(forKey: "UserName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if userId != nil{
			aCoder.encode(userId, forKey: "UserId")
		}
		if userName != nil{
			aCoder.encode(userName, forKey: "UserName")
		}

	}

}