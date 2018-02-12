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
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.25, height: 0.25)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
    }
    
}
