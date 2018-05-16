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
    
    static func GetUserByLogin(user: String, pass: String) -> String{
        return ApiUrl + "user/getbylogin/?email=" + user + "&password=" + pass
    }
}
