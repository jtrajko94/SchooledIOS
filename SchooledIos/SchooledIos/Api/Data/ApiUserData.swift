//
//  ApiUserService.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/15/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiUserData{
    var UserRowKey: String = ""
    var UserTypeRowKey: String = ""
    var SchoolRowKey: String = ""
    var Email: String = ""
    var Password: String = ""
    var FirstName: String = ""
    var LastName: String = ""
    var IsFacebook: Bool = false
    var GameDifficulty: Int = 5
    var Timestamp: Date = Date()
    var CreatedOn: Date = Date()
    
    init(){
        UserRowKey = ""
        UserTypeRowKey = ""
        SchoolRowKey = ""
        Email = ""
        Password = ""
        FirstName = ""
        LastName = ""
        IsFacebook = false
        GameDifficulty = 0
        Timestamp = Date()
        CreatedOn = Date()
    }
    
    init(json: [String: Any]){
        UserRowKey = json["UserRowKey"] as? String ?? ""
        UserTypeRowKey = json["UserTypeRowKey"] as? String ?? ""
        SchoolRowKey = json["SchoolRowKey"] as? String ?? ""
        Email = json["Email"] as? String ?? ""
        Password = json["Password"] as? String ?? ""
        FirstName = json["FirstName"] as? String ?? ""
        LastName = json["LastName"] as? String ?? ""
        IsFacebook = json["IsFacebook"] as? Bool ?? false
        GameDifficulty = json["GameDifficulty"] as? Int ?? 0
        Timestamp = json["Timestamp"] as? Date ?? Date()
        CreatedOn = json["CreatedOn"] as? Date ?? Date()
    }
}
