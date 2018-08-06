//
//  UserStore.swift
//  Taskatyy
//
//  Created by zoza on 06/08/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import Foundation

import Foundation

class UserStore {
    
    private static let UserKey = "User"
    private static func archiveUser(_ user :User) -> NSData {
        
        return NSKeyedArchiver.archivedData(withRootObject: user as User) as NSData
    }
    
    static func loadUser() -> User? {
        if let unarchivedObject = UserDefaults.standard.object(forKey: UserKey) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? User
        }
        return nil
    }
    
    static func saveUser(_ user : User?) {
        let archivedObject = archiveUser(user!)
        UserDefaults.standard.set(archivedObject, forKey: UserKey)
        UserDefaults.standard.synchronize()
    }
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: UserKey)
        UserDefaults.standard.synchronize()
    }
}
