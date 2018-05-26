//
//	FilterIOSResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class FilterIOSResult : NSObject, NSCoding{

	var itemPriorities : [ItemPriority]!
	var itemPrograms : [ItemProgram]!
	var itemtype : [Itemtype]!
	var itemusers : [Itemuser]!
	var status : [Statu]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		itemPriorities = [ItemPriority]()
		if let itemPrioritiesArray = dictionary["ItemPriorities"] as? [[String:Any]]{
			for dic in itemPrioritiesArray{
				let value = ItemPriority(fromDictionary: dic)
				itemPriorities.append(value)
			}
		}
		itemPrograms = [ItemProgram]()
		if let itemProgramsArray = dictionary["ItemPrograms"] as? [[String:Any]]{
			for dic in itemProgramsArray{
				let value = ItemProgram(fromDictionary: dic)
				itemPrograms.append(value)
			}
		}
		itemtype = [Itemtype]()
		if let itemtypeArray = dictionary["Itemtype"] as? [[String:Any]]{
			for dic in itemtypeArray{
				let value = Itemtype(fromDictionary: dic)
				itemtype.append(value)
			}
		}
		itemusers = [Itemuser]()
		if let itemusersArray = dictionary["Itemusers"] as? [[String:Any]]{
			for dic in itemusersArray{
				let value = Itemuser(fromDictionary: dic)
				itemusers.append(value)
			}
		}
		status = [Statu]()
		if let statusArray = dictionary["status"] as? [[String:Any]]{
			for dic in statusArray{
				let value = Statu(fromDictionary: dic)
				status.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if itemPriorities != nil{
			var dictionaryElements = [[String:Any]]()
			for itemPrioritiesElement in itemPriorities {
				dictionaryElements.append(itemPrioritiesElement.toDictionary())
			}
			dictionary["ItemPriorities"] = dictionaryElements
		}
		if itemPrograms != nil{
			var dictionaryElements = [[String:Any]]()
			for itemProgramsElement in itemPrograms {
				dictionaryElements.append(itemProgramsElement.toDictionary())
			}
			dictionary["ItemPrograms"] = dictionaryElements
		}
		if itemtype != nil{
			var dictionaryElements = [[String:Any]]()
			for itemtypeElement in itemtype {
				dictionaryElements.append(itemtypeElement.toDictionary())
			}
			dictionary["Itemtype"] = dictionaryElements
		}
		if itemusers != nil{
			var dictionaryElements = [[String:Any]]()
			for itemusersElement in itemusers {
				dictionaryElements.append(itemusersElement.toDictionary())
			}
			dictionary["Itemusers"] = dictionaryElements
		}
		if status != nil{
			var dictionaryElements = [[String:Any]]()
			for statusElement in status {
				dictionaryElements.append(statusElement.toDictionary())
			}
			dictionary["status"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         itemPriorities = aDecoder.decodeObject(forKey :"ItemPriorities") as? [ItemPriority]
         itemPrograms = aDecoder.decodeObject(forKey :"ItemPrograms") as? [ItemProgram]
         itemtype = aDecoder.decodeObject(forKey :"Itemtype") as? [Itemtype]
         itemusers = aDecoder.decodeObject(forKey :"Itemusers") as? [Itemuser]
         status = aDecoder.decodeObject(forKey :"status") as? [Statu]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if itemPriorities != nil{
			aCoder.encode(itemPriorities, forKey: "ItemPriorities")
		}
		if itemPrograms != nil{
			aCoder.encode(itemPrograms, forKey: "ItemPrograms")
		}
		if itemtype != nil{
			aCoder.encode(itemtype, forKey: "Itemtype")
		}
		if itemusers != nil{
			aCoder.encode(itemusers, forKey: "Itemusers")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
