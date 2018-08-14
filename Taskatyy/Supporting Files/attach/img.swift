//
//	img.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class img : NSObject, NSCoding{

	var imageResult : [ImageResult]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		imageResult = [ImageResult]()
		if let imageResultArray = dictionary["ImageResult"] as? [[String:Any]]{
			for dic in imageResultArray{
				let value = ImageResult(fromDictionary: dic)
				imageResult.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if imageResult != nil{
			var dictionaryElements = [[String:Any]]()
			for imageResultElement in imageResult {
				dictionaryElements.append(imageResultElement.toDictionary())
			}
			dictionary["ImageResult"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         imageResult = aDecoder.decodeObject(forKey :"ImageResult") as? [ImageResult]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if imageResult != nil{
			aCoder.encode(imageResult, forKey: "ImageResult")
		}

	}

}