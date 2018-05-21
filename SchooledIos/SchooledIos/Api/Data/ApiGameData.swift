//
//  ApiGameData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/19/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiGameData: NSObject, NSCoding{
    var GameRowKey: String = ""
    var Name: String = ""
    var Image: String = ""
    var Timestamp: Date = Date()
    var CreatedOn: Date = Date()
    
    override init(){
        GameRowKey = ""
        Name = ""
        Image = ""
        Timestamp = Date()
        CreatedOn = Date()
    }
    
    required init(coder decoder: NSCoder) {
        self.GameRowKey = decoder.decodeObject(forKey: "GameRowKey") as? String ?? ""
        self.Name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.Image = decoder.decodeObject(forKey: "Image") as? String ?? ""
        self.Timestamp = decoder.decodeObject(forKey: "Timestamp") as? Date ?? Date()
        self.CreatedOn = decoder.decodeObject(forKey: "CreatedOn") as? Date ?? Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(GameRowKey, forKey: "GameRowKey")
        coder.encode(Name, forKey: "Name")
        coder.encode(Image, forKey: "Image")
        coder.encode(Timestamp, forKey: "Timestamp")
        coder.encode(CreatedOn, forKey: "CreatedOn")
    }
    
    init(json: [String: Any]){
        GameRowKey = json["GameRowKey"] as? String ?? ""
        Name = json["Name"] as? String ?? ""
        Image = json["Image"] as? String ?? ""
        Timestamp = json["Timestamp"] as? Date ?? Date()
        CreatedOn = json["CreatedOn"] as? Date ?? Date()
    }
}

