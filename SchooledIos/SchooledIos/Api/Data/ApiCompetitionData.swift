//
//  ApiCompetitionData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/19/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiCompetitionData: NSObject, NSCoding{
    var CompetitionRowKey: String = ""
    var SchoolTypeRowKey: String = ""
    var UserTypeRowKey: String = ""
    var BeginDate: Date = Date()
    var EndDate: Date = Date()
    var PrizeOneName: String = ""
    var PrizeOneCost: String = ""
    var PrizeOneImage: String = ""
    var PrizeTwoName: String = ""
    var PrizeTwoCost: String = ""
    var PrizeTwoImage: String = ""
    var PrizeThreeName: String = ""
    var PrizeThreeCost: String = ""
    var PrizeThreeImage: String = ""
    var State: String = ""
    var Country: String = ""
    var Name: String = ""
    var Description: String = ""
    var IsIndividual: Bool = false
    
    override init(){
        CompetitionRowKey = ""
        SchoolTypeRowKey = ""
        UserTypeRowKey = ""
        BeginDate = Date()
        EndDate = Date()
        PrizeOneName = ""
        PrizeOneCost = ""
        PrizeOneImage = ""
        PrizeTwoName = ""
        PrizeTwoCost = ""
        PrizeTwoImage = ""
        PrizeThreeName = ""
        PrizeThreeCost = ""
        PrizeThreeImage = ""
        State = ""
        Country = ""
        Name = ""
        Description = ""
        IsIndividual = false
    }
    
    required init(coder decoder: NSCoder) {
        self.CompetitionRowKey = decoder.decodeObject(forKey: "CompetitionRowKey") as? String ?? ""
        self.SchoolTypeRowKey = decoder.decodeObject(forKey: "SchoolTypeRowKey") as? String ?? ""
        self.UserTypeRowKey = decoder.decodeObject(forKey: "UserTypeRowKey") as? String ?? ""
        self.BeginDate = decoder.decodeObject(forKey: "BeginDate") as? Date ?? Date()
        self.EndDate = decoder.decodeObject(forKey: "EndDate") as? Date ?? Date()
        self.PrizeOneName = decoder.decodeObject(forKey: "PrizeOneName") as? String ?? ""
        self.PrizeOneCost = decoder.decodeObject(forKey: "PrizeOneCost") as? String ?? ""
        self.PrizeOneImage = decoder.decodeObject(forKey: "PrizeOneImage") as? String ?? ""
        self.PrizeTwoName = decoder.decodeObject(forKey: "PrizeTwoName") as? String ?? ""
        self.PrizeTwoCost = decoder.decodeObject(forKey: "PrizeTwoCost") as? String ?? ""
        self.PrizeTwoImage = decoder.decodeObject(forKey: "PrizeTwoImage") as? String ?? ""
        self.PrizeThreeName = decoder.decodeObject(forKey: "PrizeThreeName") as? String ?? ""
        self.PrizeThreeCost = decoder.decodeObject(forKey: "PrizeThreeCost") as? String ?? ""
        self.PrizeThreeImage = decoder.decodeObject(forKey: "PrizeThreeImage") as? String ?? ""
        self.State = decoder.decodeObject(forKey: "State") as? String ?? ""
        self.Country = decoder.decodeObject(forKey: "Country") as? String ?? ""
        self.Name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.Description = decoder.decodeObject(forKey: "Description") as? String ?? ""
        self.IsIndividual = decoder.decodeBool(forKey: "IsIndividual")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(CompetitionRowKey, forKey: "CompetitionRowKey")
        coder.encode(SchoolTypeRowKey, forKey: "SchoolTypeRowKey")
        coder.encode(UserTypeRowKey, forKey: "UserTypeRowKey")
        coder.encode(BeginDate, forKey: "BeginDate")
        coder.encode(EndDate, forKey: "EndDate")
        coder.encode(PrizeOneName, forKey: "PrizeOneName")
        coder.encode(PrizeOneCost, forKey: "PrizeOneCost")
        coder.encode(PrizeOneImage, forKey: "PrizeOneImage")
        coder.encode(PrizeTwoName, forKey: "PrizeTwoName")
        coder.encode(PrizeTwoCost, forKey: "PrizeTwoCost")
        coder.encode(PrizeTwoImage, forKey: "PrizeTwoImage")
        coder.encode(PrizeThreeName, forKey: "PrizeThreeName")
        coder.encode(PrizeThreeCost, forKey: "PrizeThreeCost")
        coder.encode(PrizeThreeImage, forKey: "PrizeThreeImage")
        coder.encode(State, forKey: "State")
        coder.encode(Country, forKey: "Country")
        coder.encode(Name, forKey: "Name")
        coder.encode(Description, forKey: "Description")
        coder.encode(IsIndividual, forKey: "IsIndividual")
    }
    
    init(json: [String: Any]){
        CompetitionRowKey = json["CompetitionRowKey"] as? String ?? ""
        SchoolTypeRowKey = json["SchoolTypeRowKey"] as? String ?? ""
        UserTypeRowKey = json["UserTypeRowKey"] as? String ?? ""
        BeginDate = json["BeginDate"] as? Date ?? Date()
        EndDate = json["EndDate"] as? Date ?? Date()
        PrizeOneName = json["PrizeOneName"] as? String ?? ""
        PrizeOneCost = json["PrizeOneCost"] as? String ?? ""
        PrizeOneImage = json["PrizeOneImage"] as? String ?? ""
        PrizeTwoName = json["PrizeTwoName"] as? String ?? ""
        PrizeTwoCost = json["PrizeTwoCost"] as? String ?? ""
        PrizeTwoImage = json["PrizeTwoImage"] as? String ?? ""
        PrizeThreeName = json["PrizeThreeName"] as? String ?? ""
        PrizeThreeCost = json["PrizeThreeCost"] as? String ?? ""
        PrizeThreeImage = json["PrizeThreeImage"] as? String ?? ""
        State = json["State"] as? String ?? ""
        Country = json["Country"] as? String ?? ""
        Name = json["Name"] as? String ?? ""
        Description = json["Description"] as? String ?? ""
        IsIndividual = json["IsIndividual"] as? Bool ?? false
    }
}
