//
//  ButtonStyling.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/11/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation
import UIKit

class ButtonStyling {
    
    //Default White Text and Shadow Styling
    func defaultStyling(button: UIButton) {
    }
    
    static func disableButton(button: UIButton){
        button.isEnabled = false
        button.alpha = 0.5;
    }
    
    static func enableButton(button: UIButton){
        button.isEnabled = true
        button.alpha = 1.0;
    }
}
