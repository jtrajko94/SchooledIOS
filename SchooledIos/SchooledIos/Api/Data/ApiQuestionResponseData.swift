//
//  ApiQuestionResponseData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/18/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiQuestionResponseData: NSObject, NSCoding{
    var ResponseRowKey: String = ""
    var GameCompletionKey: String = ""
    var UserRowKey: String = ""
    var QuestionRowKey: String = ""
    var ChosenAnswer: Int = 0
    var IsCorrect: Bool = false
    
    override init(){
        ResponseRowKey = ""
        GameCompletionKey = ""
        UserRowKey = ""
        QuestionRowKey = ""
        ChosenAnswer = 0
        IsCorrect = false
    }
    
    required init(coder decoder: NSCoder) {
        self.ResponseRowKey = decoder.decodeObject(forKey: "ResponseRowKey") as? String ?? ""
        self.GameCompletionKey = decoder.decodeObject(forKey: "GameCompletionKey") as? String ?? ""
        self.UserRowKey = decoder.decodeObject(forKey: "UserRowKey") as? String ?? ""
        self.QuestionRowKey = decoder.decodeObject(forKey: "QuestionRowKey") as? String ?? ""
        self.ChosenAnswer = decoder.decodeInteger(forKey: "ChosenAnswer")
        self.IsCorrect = decoder.decodeBool(forKey: "IsCorrect")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(ResponseRowKey, forKey: "ResponseRowKey")
        coder.encode(GameCompletionKey, forKey: "GameCompletionKey")
        coder.encode(UserRowKey, forKey: "UserRowKey")
        coder.encode(QuestionRowKey, forKey: "QuestionRowKey")
        coder.encode(ChosenAnswer, forKey: "ChosenAnswer")
        coder.encode(IsCorrect, forKey: "IsCorrect")
    }
    
    init(json: [String: Any]){
        ResponseRowKey = json["ResponseRowKey"] as? String ?? ""
        GameCompletionKey = json["GameCompletionKey"] as? String ?? ""
        UserRowKey = json["UserRowKey"] as? String ?? ""
        QuestionRowKey = json["QuestionRowKey"] as? String ?? ""
        ChosenAnswer = json["ChosenAnswer"] as? Int ?? 0
        IsCorrect = json["IsCorrect"] as? Bool ?? false
    }
}
