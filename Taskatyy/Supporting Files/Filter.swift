//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Filter : NSObject, NSCoding{

	var filterIOSResult : FilterIOSResult!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let filterIOSResultData = dictionary["FilterIOSResult"] as? [String:Any]{
			filterIOSResult = FilterIOSResult(fromDictionary: filterIOSResultData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if filterIOSResult != nil{
			dictionary["FilterIOSResult"] = filterIOSResult.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         filterIOSResult = aDecoder.decodeObject(forKey: "FilterIOSResult") as? FilterIOSResult

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if filterIOSResult != nil{
			aCoder.encode(filterIOSResult, forKey: "FilterIOSResult")
		}

	}

}
