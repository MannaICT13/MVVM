//
//  UserModel.swift
//  MVVM
//
//  Created by Sharetrip-iOS on 18/08/2021.
//

import Foundation

class UserModel : Decodable{
    
    let id : Int
    let name : String
    let email : String
    
    init(id :Int ,name:String ,email:String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
}
