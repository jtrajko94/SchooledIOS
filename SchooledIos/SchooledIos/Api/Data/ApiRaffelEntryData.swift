//
//  ApiRaffelEntryData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/19/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiRaffelEntryData: NSObject, NSCoding{
    var RaffelEntryRowKey: String = ""
    var UserRowKey: String = ""
    var CompetitionRowKey: String = ""
    var TicketCount: Int = 0
    var Timestamp: Date = Date()
    var CreatedOn: Date = Date()
    
    override init(){
        RaffelEntryRowKey = ""
        UserRowKey = ""
        CompetitionRowKey = ""
        TicketCount = 0
        Timestamp = Date()
        CreatedOn = Date()
    }
    
    required init(coder decoder: NSCoder) {
        self.RaffelEntryRowKey = decoder.decodeObject(forKey: "RaffelEntryRowKey") as? String ?? ""
        self.UserRowKey = decoder.decodeObject(forKey: "UserRowKey") as? String ?? ""
        self.CompetitionRowKey = decoder.decodeObject(forKey: "CompetitionRowKey") as? String ?? ""
        self.TicketCount = decoder.decodeInteger(forKey: "TicketCount")
        self.Timestamp = decoder.decodeObject(forKey: "Timestamp") as? Date ?? Date()
        self.CreatedOn = decoder.decodeObject(forKey: "CreatedOn") as? Date ?? Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(RaffelEntryRowKey, forKey: "RaffelEntryRowKey")
        coder.encode(UserRowKey, forKey: "UserRowKey")
        coder.encode(CompetitionRowKey, forKey: "CompetitionRowKey")
        coder.encode(TicketCount, forKey: "TicketCount")
        coder.encode(Timestamp, forKey: "Timestamp")
        coder.encode(CreatedOn, forKey: "CreatedOn")
    }
    
    init(json: [String: Any]){
        RaffelEntryRowKey = json["RaffelEntryRowKey"] as? String ?? ""
        UserRowKey = json["UserRowKey"] as? String ?? ""
        CompetitionRowKey = json["CompetitionRowKey"] as? String ?? ""
        TicketCount = json["TicketCount"] as? Int ?? 0
        Timestamp = json["Timestamp"] as? Date ?? Date()
        CreatedOn = json["CreatedOn"] as? Date ?? Date()
    }
}
