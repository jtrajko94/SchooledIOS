//
//  ApiCollectionData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/19/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiCollectionData: NSObject, NSCoding{
    var CollectionRowKey: String = ""
    var Name: String = ""
    var Image: String = ""
    var IsTextbook: Bool = false
    var Timestamp: Date = Date()
    var CreatedOn: Date = Date()
    
    override init(){
        CollectionRowKey = ""
        Name = ""
        Image = ""
        IsTextbook = false
        Timestamp = Date()
        CreatedOn = Date()
    }
    
    required init(coder decoder: NSCoder) {
        self.CollectionRowKey = decoder.decodeObject(forKey: "CollectionRowKey") as? String ?? ""
        self.Name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.Image = decoder.decodeObject(forKey: "Image") as? String ?? ""
        self.IsTextbook = decoder.decodeBool(forKey: "IsTextbook")
        self.Timestamp = decoder.decodeObject(forKey: "Timestamp") as? Date ?? Date()
        self.CreatedOn = decoder.decodeObject(forKey: "CreatedOn") as? Date ?? Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(CollectionRowKey, forKey: "CollectionRowKey")
        coder.encode(Name, forKey: "Name")
        coder.encode(Image, forKey: "Image")
        coder.encode(IsTextbook, forKey: "IsTextbook")
        coder.encode(Timestamp, forKey: "Timestamp")
        coder.encode(CreatedOn, forKey: "CreatedOn")
    }
    
    init(json: [String: Any]){
        CollectionRowKey = json["CollectionRowKey"] as? String ?? ""
        Name = json["Name"] as? String ?? ""
        Image = json["Image"] as? String ?? ""
        IsTextbook = json["IsTextbook"] as? Bool ?? false
        Timestamp = json["Timestamp"] as? Date ?? Date()
        CreatedOn = json["CreatedOn"] as? Date ?? Date()
    }
}
