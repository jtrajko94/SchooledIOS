//
//  ApiQuestionData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/19/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiQuestionData: NSObject, NSCoding{
    var QuestionRowKey: String = ""
    var CourseRowKey: String = ""
    var CollectionRowKey: String = ""
    var TotalAnswers: Int = 0
    var Question: String = ""
    var AnswerOne: String = ""
    var AnswerTwo: String = ""
    var AnswerThree: String = ""
    var AnswerFour: String = ""
    var Difficulty: Int = 5
    var CorrectAnswer: Int = 0
    
    override init(){
        QuestionRowKey = ""
        CourseRowKey = ""
        CollectionRowKey = ""
        TotalAnswers = 0
        Question = ""
        AnswerOne = ""
        AnswerTwo = ""
        AnswerThree = ""
        AnswerFour = ""
        Difficulty = 5
        CorrectAnswer = 0
    }
    
    required init(coder decoder: NSCoder) {
        self.QuestionRowKey = decoder.decodeObject(forKey: "QuestionRowKey") as? String ?? ""
        self.CourseRowKey = decoder.decodeObject(forKey: "CourseRowKey") as? String ?? ""
        self.CollectionRowKey = decoder.decodeObject(forKey: "CollectionRowKey") as? String ?? ""
        self.TotalAnswers = decoder.decodeInteger(forKey: "TotalAnswers")
        self.Question = decoder.decodeObject(forKey: "Question") as? String ?? ""
        self.AnswerOne = decoder.decodeObject(forKey: "AnswerOne") as? String ?? ""
        self.AnswerTwo = decoder.decodeObject(forKey: "AnswerTwo") as? String ?? ""
        self.AnswerThree = decoder.decodeObject(forKey: "AnswerThree") as? String ?? ""
        self.AnswerFour = decoder.decodeObject(forKey: "AnswerFour") as? String ?? ""
        self.Difficulty = decoder.decodeInteger(forKey: "Difficulty")
        self.CorrectAnswer = decoder.decodeInteger(forKey: "CorrectAnswer")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(QuestionRowKey, forKey: "QuestionRowKey")
        coder.encode(CourseRowKey, forKey: "CourseRowKey")
        coder.encode(CollectionRowKey, forKey: "CollectionRowKey")
        coder.encode(TotalAnswers, forKey: "TotalAnswers")
        coder.encode(Question, forKey: "Question")
        coder.encode(AnswerOne, forKey: "AnswerOne")
        coder.encode(AnswerTwo, forKey: "AnswerTwo")
        coder.encode(AnswerThree, forKey: "AnswerThree")
        coder.encode(AnswerFour, forKey: "AnswerFour")
        coder.encode(Difficulty, forKey: "Difficulty")
        coder.encode(CorrectAnswer, forKey: "CorrectAnswer")
    }
    
    init(json: [String: Any]){
        QuestionRowKey = json["QuestionRowKey"] as? String ?? ""
        CourseRowKey = json["CourseRowKey"] as? String ?? ""
        CollectionRowKey = json["CollectionRowKey"] as? String ?? ""
        TotalAnswers = json["TotalAnswers"] as? Int ?? 0
        Question = json["Question"] as? String ?? ""
        AnswerOne = json["AnswerOne"] as? String ?? ""
        AnswerTwo = json["AnswerTwo"] as? String ?? ""
        AnswerThree = json["AnswerThree"] as? String ?? ""
        AnswerFour = json["AnswerFour"] as? String ?? ""
        Difficulty = json["Difficulty"] as? Int ?? 5
        CorrectAnswer = json["CorrectAnswer"] as? Int ?? 0
    }
}

