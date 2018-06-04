//
//  ApiUserTypeData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/18/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiUserTypeData: NSObject, NSCoding{
    var UserTypeRowKey: String = ""
    var Name: String = ""
    var DefaultDifficulty: Int = 5
    
    override init(){
        UserTypeRowKey = ""
        Name = ""
        DefaultDifficulty = 0
    }
    
    required init(coder decoder: NSCoder) {
        self.UserTypeRowKey = decoder.decodeObject(forKey: "UserTypeRowKey") as? String ?? ""
        self.Name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.DefaultDifficulty = decoder.decodeInteger(forKey: "DefaultDifficulty")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(UserTypeRowKey, forKey: "UserTypeRowKey")
        coder.encode(Name, forKey: "Name")
        coder.encode(DefaultDifficulty, forKey: "DefaultDifficulty")
    }
    
    init(json: [String: Any]){
        UserTypeRowKey = json["UserTypeRowKey"] as? String ?? ""
        Name = json["Name"] as? String ?? ""
        DefaultDifficulty = json["DefaultDifficulty"] as? Int ?? 0
    }
}
