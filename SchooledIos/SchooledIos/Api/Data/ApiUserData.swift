//
//  ApiUserService.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/15/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiUserData: NSObject, NSCoding, Codable{
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
    
    override init(){
        UserRowKey = ""
        UserTypeRowKey = ""
        SchoolRowKey = ""
        Email = ""
        Password = ""
        FirstName = ""
        LastName = ""
        IsFacebook = false
        GameDifficulty = 5
        Timestamp = Date()
        CreatedOn = Date()
    }
    
    required init(coder decoder: NSCoder) {
        self.UserRowKey = decoder.decodeObject(forKey: "UserRowKey") as? String ?? ""
        self.UserTypeRowKey = decoder.decodeObject(forKey: "UserTypeRowKey") as? String ?? ""
        self.SchoolRowKey = decoder.decodeObject(forKey: "SchoolRowKey") as? String ?? ""
        self.Email = decoder.decodeObject(forKey: "Email") as? String ?? ""
        self.Password = decoder.decodeObject(forKey: "Password") as? String ?? ""
        self.FirstName = decoder.decodeObject(forKey: "FirstName") as? String ?? ""
        self.LastName = decoder.decodeObject(forKey: "LastName") as? String ?? ""
        self.IsFacebook = decoder.decodeBool(forKey: "IsFacebook")
        self.GameDifficulty = decoder.decodeInteger(forKey: "GameDifficulty")
        self.Timestamp = decoder.decodeObject(forKey: "Timestamp") as? Date ?? Date()
        self.CreatedOn = decoder.decodeObject(forKey: "CreatedOn") as? Date ?? Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(UserRowKey, forKey: "UserRowKey")
        coder.encode(UserTypeRowKey, forKey: "UserTypeRowKey")
        coder.encode(SchoolRowKey, forKey: "SchoolRowKey")
        coder.encode(Email, forKey: "Email")
        coder.encode(Password, forKey: "Password")
        coder.encode(FirstName, forKey: "FirstName")
        coder.encode(LastName, forKey: "LastName")
        coder.encode(IsFacebook, forKey: "IsFacebook")
        coder.encode(GameDifficulty, forKey: "GameDifficulty")
        coder.encode(Timestamp, forKey: "Timestamp")
        coder.encode(CreatedOn, forKey: "CreatedOn")
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
        GameDifficulty = json["GameDifficulty"] as? Int ?? 5
        Timestamp = json["Timestamp"] as? Date ?? Date()
        CreatedOn = json["CreatedOn"] as? Date ?? Date()
    }
    
    static func getCurrentUser() -> ApiUserData?{
        if let data = UserDefaults.standard.data(forKey: "CurrentUser"),
            let dataUser = NSKeyedUnarchiver.unarchiveObject(with: data) as? ApiUserData
        {
            return dataUser
        }
        return nil
    }
}
