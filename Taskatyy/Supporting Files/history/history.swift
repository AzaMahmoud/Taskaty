//
//	history.swift
//
//	Create by Zoz on 29/7/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class history : NSObject, NSCoding{

	var iHistoryResult : [IHistoryResult]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		iHistoryResult = [IHistoryResult]()
		if let iHistoryResultArray = dictionary["IHistoryResult"] as? [[String:Any]]{
			for dic in iHistoryResultArray{
				let value = IHistoryResult(fromDictionary: dic)
				iHistoryResult.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if iHistoryResult != nil{
			var dictionaryElements = [[String:Any]]()
			for iHistoryResultElement in iHistoryResult {
				dictionaryElements.append(iHistoryResultElement.toDictionary())
			}
			dictionary["IHistoryResult"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         iHistoryResult = aDecoder.decodeObject(forKey :"IHistoryResult") as? [IHistoryResult]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if iHistoryResult != nil{
			aCoder.encode(iHistoryResult, forKey: "IHistoryResult")
		}

	}

}
