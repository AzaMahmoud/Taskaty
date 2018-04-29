//
//	Filer.swift
//
//	Create by Zoz on 17/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Filter{

	var filterResult : FilterResult!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let filterResultData = dictionary["FilterResult"] as? [String:Any]{
			filterResult = FilterResult(fromDictionary: filterResultData)
		}
	}

}
