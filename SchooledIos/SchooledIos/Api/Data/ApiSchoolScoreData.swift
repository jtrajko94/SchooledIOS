//
//  ApiSchoolScoreData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/18/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiSchoolScoreData: NSObject, NSCoding{
    var SchoolScoreRowKey: String = ""
    var CompetitionRowKey: String = ""
    var SchoolRowKey: String = ""
    var Points: Int? = 0
    var Timestamp: Date = Date()
    var CreatedOn: Date = Date()
    
    override init(){
        SchoolScoreRowKey = ""
        CompetitionRowKey = ""
        SchoolRowKey = ""
        Points = 0
        Timestamp = Date()
        CreatedOn = Date()
    }
    
    required init(coder decoder: NSCoder) {
        self.SchoolScoreRowKey = decoder.decodeObject(forKey: "SchoolScoreRowKey") as? String ?? ""
        self.CompetitionRowKey = decoder.decodeObject(forKey: "CompetitionRowKey") as? String ?? ""
        self.SchoolRowKey = decoder.decodeObject(forKey: "SchoolRowKey") as? String ?? ""
        self.Points = decoder.decodeInteger(forKey: "Points")
        self.Timestamp = decoder.decodeObject(forKey: "Timestamp") as? Date ?? Date()
        self.CreatedOn = decoder.decodeObject(forKey: "CreatedOn") as? Date ?? Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(SchoolScoreRowKey, forKey: "SchoolScoreRowKey")
        coder.encode(CompetitionRowKey, forKey: "CompetitionRowKey")
        coder.encode(SchoolRowKey, forKey: "SchoolRowKey")
        coder.encode(Points, forKey: "Points")
        coder.encode(Timestamp, forKey: "Timestamp")
        coder.encode(CreatedOn, forKey: "CreatedOn")
    }
    
    init(json: [String: Any]){
        SchoolScoreRowKey = json["SchoolScoreRowKey"] as? String ?? ""
        CompetitionRowKey = json["CompetitionRowKey"] as? String ?? ""
        SchoolRowKey = json["SchoolRowKey"] as? String ?? ""
        Points = json["Points"] as? Int ?? 0
        Timestamp = json["Timestamp"] as? Date ?? Date()
        CreatedOn = json["CreatedOn"] as? Date ?? Date()
    }
}

