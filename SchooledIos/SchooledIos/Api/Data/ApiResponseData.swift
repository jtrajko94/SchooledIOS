//
//  ApiResponseData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/15/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiResponseData{
    var status: String = ""
    var description: String = ""
    
    init(){
        status = ""
        description = ""
    }
    
    init(json: [String: Any]){
        status = json["status"] as? String ?? ""
        description = json["description"] as? String ?? ""
    }
}
