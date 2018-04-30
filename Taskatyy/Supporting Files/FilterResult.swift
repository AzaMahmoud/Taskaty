//
//	FilterResult.swift
//
//	Create by Zoz on 17/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class FilterResult{

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

}
