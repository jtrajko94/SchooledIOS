//
//  SchoolTypeData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/18/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiSchoolTypeData: NSObject, NSCoding{
    var SchoolTypeRowKey: String = ""
    var Name: String = ""
    
    override init(){
        SchoolTypeRowKey = ""
        Name = ""
    }
    
    required init(coder decoder: NSCoder) {
        self.SchoolTypeRowKey = decoder.decodeObject(forKey: "SchoolTypeRowKey") as? String ?? ""
        self.Name = decoder.decodeObject(forKey: "Name") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(SchoolTypeRowKey, forKey: "SchoolTypeRowKey")
        coder.encode(Name, forKey: "Name")
    }
    
    init(json: [String: Any]){
        SchoolTypeRowKey = json["SchoolTypeRowKey"] as? String ?? ""
        Name = json["Name"] as? String ?? ""
    }
}
