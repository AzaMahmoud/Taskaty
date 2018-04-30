//
//	ItemProgram.swift
//
//	Create by Zoz on 17/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class ItemProgram{

	var workItemProgram : String!
	var workItemProgramId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		workItemProgram = dictionary["WorkItemProgram"] as? String
		workItemProgramId = dictionary["WorkItemProgramId"] as? Int
	}

}