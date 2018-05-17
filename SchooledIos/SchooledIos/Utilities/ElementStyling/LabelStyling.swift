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
    
    //Default White Text and Outlining
    static func defaultStyling(label: UILabel, fontSize: CGFloat) {

        let attributedString = NSAttributedString(string: label.text!, attributes: [
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.font : UIFont(name: "ChalkboardSE-Bold", size: fontSize)!
            ])
        
        label.attributedText = attributedString
        label.font = UIFont(name: label.font.fontName, size: fontSize);
    }
}
