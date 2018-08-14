//
//	ImageResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ImageResult : NSObject, NSCoding{

	var workItemsAttachmentPath : String?


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		workItemsAttachmentPath = dictionary["WorkItemsAttachmentPath"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if workItemsAttachmentPath != nil{
			dictionary["WorkItemsAttachmentPath"] = workItemsAttachmentPath
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         workItemsAttachmentPath = aDecoder.decodeObject(forKey: "WorkItemsAttachmentPath") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if workItemsAttachmentPath != nil{
			aCoder.encode(workItemsAttachmentPath, forKey: "WorkItemsAttachmentPath")
		}

	}

}
