//
//  TextMethods.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/15/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class TextMethods {
    static func IsApiDescriptionValid (text: String) -> Bool
    {
        var valid = true;
        if(text == "" || text == "[]" || text == "null" || text == nil){
            valid = false;
        }
        return valid;
    }
}
