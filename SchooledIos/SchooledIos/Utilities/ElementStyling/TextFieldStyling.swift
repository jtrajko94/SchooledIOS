//
//  TextFieldStyling.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/16/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation
import UIKit

class TextFieldStyling {
    
    static func errorStyling(textField: UITextField){
        let errorColor = UIColor.red
        textField.layer.borderColor = errorColor.cgColor
        textField.layer.borderWidth = 1.0
    }
    
    static func removeErrorStyling(textField: UITextField){
        let correctColor = UIColor.white
        textField.layer.borderColor = correctColor.cgColor
        textField.layer.borderWidth = 0
    }
    
    static func disableTextField(textField: UITextField){
        textField.isEnabled = false
        textField.alpha = 0.5;
    }
    
    static func enableTextField(textField: UITextField){
        textField.isEnabled = true
        textField.alpha = 1.0;
    }
    
}
