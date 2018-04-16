//
//  String-Exensions.swift
//  Taskatyy
//
//  Created by zoza on 15/04/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
