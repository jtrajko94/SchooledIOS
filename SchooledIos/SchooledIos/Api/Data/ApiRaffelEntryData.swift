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
    
    override init(){
        RaffelEntryRowKey = ""
        UserRowKey = ""
        CompetitionRowKey = ""
        TicketCount = 0
    }
    
    required init(coder decoder: NSCoder) {
        self.RaffelEntryRowKey = decoder.decodeObject(forKey: "RaffelEntryRowKey") as? String ?? ""
        self.UserRowKey = decoder.decodeObject(forKey: "UserRowKey") as? String ?? ""
        self.CompetitionRowKey = decoder.decodeObject(forKey: "CompetitionRowKey") as? String ?? ""
        self.TicketCount = decoder.decodeInteger(forKey: "TicketCount")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(RaffelEntryRowKey, forKey: "RaffelEntryRowKey")
        coder.encode(UserRowKey, forKey: "UserRowKey")
        coder.encode(CompetitionRowKey, forKey: "CompetitionRowKey")
        coder.encode(TicketCount, forKey: "TicketCount")
    }
    
    init(json: [String: Any]){
        RaffelEntryRowKey = json["RaffelEntryRowKey"] as? String ?? ""
        UserRowKey = json["UserRowKey"] as? String ?? ""
        CompetitionRowKey = json["CompetitionRowKey"] as? String ?? ""
        TicketCount = json["TicketCount"] as? Int ?? 0
    }
}
