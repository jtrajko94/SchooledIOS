//
//  ApiSchoolData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/18/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiSchoolData: NSObject, NSCoding{
    var SchoolRowKey: String = ""
    var SchoolTypeRowKey: String = ""
    var Name: String = ""
    var StudentCount: Int = 5
    var Street: String = ""
    var City: String = ""
    var State: String = ""
    var Zipcode: String = ""
    var District: String = ""
    var Country: String = ""
    var Timestamp: Date = Date()
    var CreatedOn: Date = Date()
    
    override init(){
        SchoolRowKey = ""
        SchoolTypeRowKey = ""
        Name = ""
        StudentCount = 0
        Street = ""
        City = ""
        State = ""
        Zipcode = ""
        District = ""
        Country = ""
        Timestamp = Date()
        CreatedOn = Date()
    }
    
    required init(coder decoder: NSCoder) {
        self.SchoolRowKey = decoder.decodeObject(forKey: "SchoolRowKey") as? String ?? ""
        self.SchoolTypeRowKey = decoder.decodeObject(forKey: "SchoolTypeRowKey") as? String ?? ""
        self.Name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.StudentCount = decoder.decodeInteger(forKey: "StudentCount")
        self.Street = decoder.decodeObject(forKey: "Street") as? String ?? ""
        self.City = decoder.decodeObject(forKey: "City") as? String ?? ""
        self.State = decoder.decodeObject(forKey: "State") as? String ?? ""
        self.Zipcode = decoder.decodeObject(forKey: "Zipcode") as? String ?? ""
        self.District = decoder.decodeObject(forKey: "District") as? String ?? ""
        self.Country = decoder.decodeObject(forKey: "Country") as? String ?? ""
        self.Timestamp = decoder.decodeObject(forKey: "Timestamp") as? Date ?? Date()
        self.CreatedOn = decoder.decodeObject(forKey: "CreatedOn") as? Date ?? Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(SchoolRowKey, forKey: "SchoolRowKey")
        coder.encode(SchoolTypeRowKey, forKey: "SchoolTypeRowKey")
        coder.encode(Name, forKey: "Name")
        coder.encode(StudentCount, forKey: "StudentCount")
        coder.encode(Street, forKey: "Street")
        coder.encode(City, forKey: "City")
        coder.encode(State, forKey: "State")
        coder.encode(Zipcode, forKey: "Zipcode")
        coder.encode(District, forKey: "District")
        coder.encode(Country, forKey: "Country")
        coder.encode(Timestamp, forKey: "Timestamp")
        coder.encode(CreatedOn, forKey: "CreatedOn")
    }
    
    init(json: [String: Any]){
        SchoolRowKey = json["SchoolRowKey"] as? String ?? ""
        SchoolTypeRowKey = json["SchoolTypeRowKey"] as? String ?? ""
        Name = json["Name"] as? String ?? ""
        StudentCount = json["StudentCount"] as? Int ?? 0
        Street = json["Street"] as? String ?? ""
        City = json["City"] as? String ?? ""
        State = json["State"] as? String ?? ""
        Zipcode = json["Zipcode"] as? String ?? ""
        District = json["District"] as? String ?? ""
        Country = json["Country"] as? String ?? ""
        Timestamp = json["Timestamp"] as? Date ?? Date()
        CreatedOn = json["CreatedOn"] as? Date ?? Date()
    }
}
