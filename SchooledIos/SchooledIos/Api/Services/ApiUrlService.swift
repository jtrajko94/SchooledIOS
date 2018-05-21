//
//  ApiUrlService.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/15/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiUrlService{
    
    static var ApiUrl : String {
        get{
            return "http://schooledapi.cloudapp.net/"
        }
    }
    
    //User API Functions
    static func GetUserById(id: String) -> String{
        return ApiUrl + "user/get/?id=" + id
    }
    
    static func GetUserByLogin(user: String, pass: String) -> String{
        return ApiUrl + "user/getbylogin/?email=" + user + "&password=" + pass
    }
    
    static func MergeUser(userJson: String) -> String{
        return ApiUrl + "user/merge/?userjson=" + userJson
    }
    
    static func GetUserType(id: String) -> String{
        return ApiUrl + "user/getusertype/?id=" + id
    }
    
    //Subject API Functions
    static func GetSubjectById(id: String) -> String{
        return ApiUrl + "subject/get/?id=" + id
    }
    
    static func MergeSubject(subjectJson: String) -> String{
        return ApiUrl + "subject/merge/?subjectjson=" + subjectJson
    }
    
    //School API Functions
    static func GetSchoolById(id: String) -> String{
        return ApiUrl + "school/get/?id=" + id
    }
    
    static func MergeSchoolScore(schoolJson: String) -> String{
        return ApiUrl + "school/merge/?schooljson=" + schoolJson
    }
    
    static func GetSchoolScoreBySearch(schoolTypeId: String, name: String, state: String, district: String, country: String) -> String{
        let parameters = "?schooltypeid=" + schoolTypeId + "&name=" + name + "&state=" + state + "&district=" + district + "&country=" + country
        return ApiUrl + "school/search/" + parameters
    }
    
    //School Score API Functions
    static func GetSchoolScoreById(id: String) -> String{
        return ApiUrl + "schoolscore/get/?id=" + id
    }
    
    static func MergeSchoolScore(schoolScoreJson: String) -> String{
        return ApiUrl + "schoolscore/merge/?schoolscorejson=" + schoolScoreJson
    }
    
    static func GetSchoolScoreByCompetition(schoolId: String, competitionId: String) -> String{
        return ApiUrl + "schoolscore/getbyschoolcompetition/?schoold=" + schoolId + "&competitionid=" + competitionId
    }
    
            //Fix API to take in state
    static func GetWinningSchoolScore(competitionId: String, count: Int?, state: String) -> String{
        let parameters = "?competitionId=" + competitionId + "&state=" + state + "&count=" + (count == nil ? "null" : String(count!))
        return ApiUrl + "schoolscore/getwinning/" + parameters
    }

    
}
