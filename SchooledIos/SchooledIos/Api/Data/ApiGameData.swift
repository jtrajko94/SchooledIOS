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
    
    override init(){
        GameRowKey = ""
        Name = ""
        Image = ""
    }
    
    required init(coder decoder: NSCoder) {
        self.GameRowKey = decoder.decodeObject(forKey: "GameRowKey") as? String ?? ""
        self.Name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.Image = decoder.decodeObject(forKey: "Image") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(GameRowKey, forKey: "GameRowKey")
        coder.encode(Name, forKey: "Name")
        coder.encode(Image, forKey: "Image")
    }
    
    init(json: [String: Any]){
        GameRowKey = json["GameRowKey"] as? String ?? ""
        Name = json["Name"] as? String ?? ""
        Image = json["Image"] as? String ?? ""
    }
}

