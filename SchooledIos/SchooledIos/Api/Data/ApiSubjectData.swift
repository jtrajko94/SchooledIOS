//
//  ApiSubjectData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/18/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiSubjectData: NSObject, NSCoding{
    var SubjectRowKey: String = ""
    var Name: String = ""
    var Image: String = ""
    var Email: String = ""
    var Timestamp: Date = Date()
    var CreatedOn: Date = Date()
    
    override init(){
        SubjectRowKey = ""
        Name = ""
        Image = ""
        Email = ""
        Timestamp = Date()
        CreatedOn = Date()
    }
    
    required init(coder decoder: NSCoder) {
        self.SubjectRowKey = decoder.decodeObject(forKey: "SubjectRowKey") as? String ?? ""
        self.Name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.Image = decoder.decodeObject(forKey: "Image") as? String ?? ""
        self.Email = decoder.decodeObject(forKey: "Email") as? String ?? ""
        self.Timestamp = decoder.decodeObject(forKey: "Timestamp") as? Date ?? Date()
        self.CreatedOn = decoder.decodeObject(forKey: "CreatedOn") as? Date ?? Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(SubjectRowKey, forKey: "SubjectRowKey")
        coder.encode(Name, forKey: "Name")
        coder.encode(Image, forKey: "Image")
        coder.encode(Email, forKey: "Email")
        coder.encode(Timestamp, forKey: "Timestamp")
        coder.encode(CreatedOn, forKey: "CreatedOn")
    }
    
    init(json: [String: Any]){
        SubjectRowKey = json["SubjectRowKey"] as? String ?? ""
        Name = json["Name"] as? String ?? ""
        Image = json["Image"] as? String ?? ""
        Email = json["Email"] as? String ?? ""
        Timestamp = json["Timestamp"] as? Date ?? Date()
        CreatedOn = json["CreatedOn"] as? Date ?? Date()
    }
}
