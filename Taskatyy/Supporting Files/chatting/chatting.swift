//
//	chatting.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class chatting : NSObject, NSCoding{

	var gChatResult : [GChatResult]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		gChatResult = [GChatResult]()
		if let gChatResultArray = dictionary["GChatResult"] as? [[String:Any]]{
			for dic in gChatResultArray{
				let value = GChatResult(fromDictionary: dic)
				gChatResult.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if gChatResult != nil{
			var dictionaryElements = [[String:Any]]()
			for gChatResultElement in gChatResult {
				dictionaryElements.append(gChatResultElement.toDictionary())
			}
			dictionary["GChatResult"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         gChatResult = aDecoder.decodeObject(forKey :"GChatResult") as? [GChatResult]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if gChatResult != nil{
			aCoder.encode(gChatResult, forKey: "GChatResult")
		}

	}

}