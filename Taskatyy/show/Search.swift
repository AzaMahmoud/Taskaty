//
//	Search.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Search : NSObject, NSCoding{

	var searchWorkItemsResult : [SearchWorkItemsResult]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		searchWorkItemsResult = [SearchWorkItemsResult]()
		if let searchWorkItemsResultArray = dictionary["SearchWorkItemsResult"] as? [[String:Any]]{
			for dic in searchWorkItemsResultArray{
				let value = SearchWorkItemsResult(fromDictionary: dic)
				searchWorkItemsResult.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if searchWorkItemsResult != nil{
			var dictionaryElements = [[String:Any]]()
			for searchWorkItemsResultElement in searchWorkItemsResult {
				dictionaryElements.append(searchWorkItemsResultElement.toDictionary())
			}
			dictionary["SearchWorkItemsResult"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         searchWorkItemsResult = aDecoder.decodeObject(forKey :"SearchWorkItemsResult") as? [SearchWorkItemsResult]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if searchWorkItemsResult != nil{
			aCoder.encode(searchWorkItemsResult, forKey: "SearchWorkItemsResult")
		}

	}

}