//
//	Itemtype.swift
//
//	Create by Zoz on 17/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Itemtype{

	var workItemType : String!
	var workItemTypeId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		workItemType = dictionary["WorkItemType"] as? String
		workItemTypeId = dictionary["WorkItemTypeId"] as? Int
	}

}