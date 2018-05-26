//
//	filterGen.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class filterGen : NSObject, NSCoding{

	var filterResultt : FilterResultt!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let filterResulttData = dictionary["FilterResultt"] as? [String:Any]{
			filterResultt = FilterResultt(fromDictionary: filterResulttData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if filterResultt != nil{
			dictionary["FilterResultt"] = filterResultt.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         filterResultt = aDecoder.decodeObject(forKey: "FilterResultt") as? FilterResultt

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if filterResultt != nil{
			aCoder.encode(filterResultt, forKey: "FilterResultt")
		}

	}

}