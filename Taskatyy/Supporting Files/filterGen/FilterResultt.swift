//
//	FilterResultt.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class FilterResultt : NSObject, NSCoding{

	var itemPrioritiess : [ItemPriorities]!
	var itemProgramss : [ItemPrograms]!
	var itemtypee : [Itemtypee]!
	var itemuserss : [Itemusers]!
	var statuss : [Status]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		itemPrioritiess = [ItemPriorities]()
		if let itemPrioritiessArray = dictionary["ItemPrioritiess"] as? [[String:Any]]{
			for dic in itemPrioritiessArray{
				let value = ItemPriorities(fromDictionary: dic)
				itemPrioritiess.append(value)
			}
		}
		itemProgramss = [ItemPrograms]()
		if let itemProgramssArray = dictionary["ItemProgramss"] as? [[String:Any]]{
			for dic in itemProgramssArray{
				let value = ItemPrograms(fromDictionary: dic)
				itemProgramss.append(value)
			}
		}
		itemtypee = [Itemtypee]()
		if let itemtypeeArray = dictionary["Itemtypee"] as? [[String:Any]]{
			for dic in itemtypeeArray{
				let value = Itemtypee(fromDictionary: dic)
				itemtypee.append(value)
			}
		}
		itemuserss = [Itemusers]()
		if let itemuserssArray = dictionary["Itemuserss"] as? [[String:Any]]{
			for dic in itemuserssArray{
				let value = Itemusers(fromDictionary: dic)
				itemuserss.append(value)
			}
		}
		statuss = [Status]()
		if let statussArray = dictionary["statuss"] as? [[String:Any]]{
			for dic in statussArray{
				let value = Status(fromDictionary: dic)
				statuss.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if itemPrioritiess != nil{
			var dictionaryElements = [[String:Any]]()
			for itemPrioritiessElement in itemPrioritiess {
				dictionaryElements.append(itemPrioritiessElement.toDictionary())
			}
			dictionary["ItemPrioritiess"] = dictionaryElements
		}
		if itemProgramss != nil{
			var dictionaryElements = [[String:Any]]()
			for itemProgramssElement in itemProgramss {
				dictionaryElements.append(itemProgramssElement.toDictionary())
			}
			dictionary["ItemProgramss"] = dictionaryElements
		}
		if itemtypee != nil{
			var dictionaryElements = [[String:Any]]()
			for itemtypeeElement in itemtypee {
				dictionaryElements.append(itemtypeeElement.toDictionary())
			}
			dictionary["Itemtypee"] = dictionaryElements
		}
		if itemuserss != nil{
			var dictionaryElements = [[String:Any]]()
			for itemuserssElement in itemuserss {
				dictionaryElements.append(itemuserssElement.toDictionary())
			}
			dictionary["Itemuserss"] = dictionaryElements
		}
		if statuss != nil{
			var dictionaryElements = [[String:Any]]()
			for statussElement in statuss {
				dictionaryElements.append(statussElement.toDictionary())
			}
			dictionary["statuss"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         itemPrioritiess = aDecoder.decodeObject(forKey :"ItemPrioritiess") as? [ItemPriorities]
         itemProgramss = aDecoder.decodeObject(forKey :"ItemProgramss") as? [ItemPrograms]
         itemtypee = aDecoder.decodeObject(forKey :"Itemtypee") as? [Itemtypee]
         itemuserss = aDecoder.decodeObject(forKey :"Itemuserss") as? [Itemusers]
         statuss = aDecoder.decodeObject(forKey :"statuss") as? [Status]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if itemPrioritiess != nil{
			aCoder.encode(itemPrioritiess, forKey: "ItemPrioritiess")
		}
		if itemProgramss != nil{
			aCoder.encode(itemProgramss, forKey: "ItemProgramss")
		}
		if itemtypee != nil{
			aCoder.encode(itemtypee, forKey: "Itemtypee")
		}
		if itemuserss != nil{
			aCoder.encode(itemuserss, forKey: "Itemuserss")
		}
		if statuss != nil{
			aCoder.encode(statuss, forKey: "statuss")
		}

	}

}