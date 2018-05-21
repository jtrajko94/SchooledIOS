//
//  ApiGameCompletionData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/19/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiGameCompletionData: NSObject, NSCoding{
    var GameCompletionKey: String = ""
    var CourseRowKey: String = ""
    var GameRowKey: String = ""
    var CompetitionRowKey: String = ""
    var UserRowKey: String = ""
    var Points: Int = 0
    var Difficulty: Int = 5
    var RaffelTickets: Int = 0
    var Timestamp: Date = Date()
    var CreatedOn: Date = Date()
    
    override init(){
        GameCompletionKey = ""
        CourseRowKey = ""
        GameRowKey = ""
        CompetitionRowKey = ""
        UserRowKey = ""
        Points = 0
        Difficulty = 0
        RaffelTickets = 0
        Timestamp = Date()
        CreatedOn = Date()
    }
    
    required init(coder decoder: NSCoder) {
        self.GameCompletionKey = decoder.decodeObject(forKey: "GameCompletionKey") as? String ?? ""
        self.CourseRowKey = decoder.decodeObject(forKey: "CourseRowKey") as? String ?? ""
        self.GameRowKey = decoder.decodeObject(forKey: "GameRowKey") as? String ?? ""
        self.CompetitionRowKey = decoder.decodeObject(forKey: "CompetitionRowKey") as? String ?? ""
        self.UserRowKey = decoder.decodeObject(forKey: "UserRowKey") as? String ?? ""
        self.Points = decoder.decodeInteger(forKey: "Points")
        self.Difficulty = decoder.decodeInteger(forKey: "Difficulty")
        self.RaffelTickets = decoder.decodeInteger(forKey: "RaffelTickets")
        self.Timestamp = decoder.decodeObject(forKey: "Timestamp") as? Date ?? Date()
        self.CreatedOn = decoder.decodeObject(forKey: "CreatedOn") as? Date ?? Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(GameCompletionKey, forKey: "GameCompletionKey")
        coder.encode(CourseRowKey, forKey: "CourseRowKey")
        coder.encode(GameRowKey, forKey: "GameRowKey")
        coder.encode(CompetitionRowKey, forKey: "CompetitionRowKey")
        coder.encode(UserRowKey, forKey: "UserRowKey")
        coder.encode(Points, forKey: "Points")
        coder.encode(Difficulty, forKey: "Difficulty")
        coder.encode(RaffelTickets, forKey: "RaffelTickets")
        coder.encode(Timestamp, forKey: "Timestamp")
        coder.encode(CreatedOn, forKey: "CreatedOn")
    }
    
    init(json: [String: Any]){
        GameCompletionKey = json["GameCompletionKey"] as? String ?? ""
        CourseRowKey = json["CourseRowKey"] as? String ?? ""
        GameRowKey = json["GameRowKey"] as? String ?? ""
        CompetitionRowKey = json["CompetitionRowKey"] as? String ?? ""
        UserRowKey = json["UserRowKey"] as? String ?? ""
        Points = json["Points"] as? Int ?? 0
        Difficulty = json["Difficulty"] as? Int ?? 5
        RaffelTickets = json["RaffelTickets"] as? Int ?? 0
        Timestamp = json["Timestamp"] as? Date ?? Date()
        CreatedOn = json["CreatedOn"] as? Date ?? Date()
    }
}
