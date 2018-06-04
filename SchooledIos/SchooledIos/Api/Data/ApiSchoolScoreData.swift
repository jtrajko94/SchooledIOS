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
    
    override init(){
        SchoolScoreRowKey = ""
        CompetitionRowKey = ""
        SchoolRowKey = ""
        Points = 0
    }
    
    required init(coder decoder: NSCoder) {
        self.SchoolScoreRowKey = decoder.decodeObject(forKey: "SchoolScoreRowKey") as? String ?? ""
        self.CompetitionRowKey = decoder.decodeObject(forKey: "CompetitionRowKey") as? String ?? ""
        self.SchoolRowKey = decoder.decodeObject(forKey: "SchoolRowKey") as? String ?? ""
        self.Points = decoder.decodeInteger(forKey: "Points")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(SchoolScoreRowKey, forKey: "SchoolScoreRowKey")
        coder.encode(CompetitionRowKey, forKey: "CompetitionRowKey")
        coder.encode(SchoolRowKey, forKey: "SchoolRowKey")
        coder.encode(Points, forKey: "Points")
    }
    
    init(json: [String: Any]){
        SchoolScoreRowKey = json["SchoolScoreRowKey"] as? String ?? ""
        CompetitionRowKey = json["CompetitionRowKey"] as? String ?? ""
        SchoolRowKey = json["SchoolRowKey"] as? String ?? ""
        Points = json["Points"] as? Int ?? 0
    }
}

