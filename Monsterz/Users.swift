//
//  Users.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 14/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import Foundation

import RealmSwift

class Users:Object{
    
    dynamic var id=0
    dynamic var email:String!
    dynamic var password:String!
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
