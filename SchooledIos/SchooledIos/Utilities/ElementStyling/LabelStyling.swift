//
//  LabelStyling.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/28/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation
import UIKit

class LabelStyling {
    
    //Default White Text and Shadow Styling
    func defaultStyling(label: UILabel, fontSize: CGFloat) {
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: label.font.fontName, size: fontSize);
        /*
        let str = NSAttributedString(string: label.text!, attributes: [
            NSAttributedStringKey.foregroundColor : UIColor.black,
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.strokeWidth : 2,
            
            ])
        */
        
        //label.attributedText = str
    }
}
