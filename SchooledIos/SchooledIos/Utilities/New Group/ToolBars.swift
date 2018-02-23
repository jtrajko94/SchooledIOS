//
//  ToolBars.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/22/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation
import UIKit

class ToolBars {
    
    var toolBarView: UIView
    
    init(view: UIView){
        toolBarView = view
    }
    
    func textFieldToolBar() -> (UIToolbar){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneClickedTextFieldToolBar))
        toolBar.setItems([flexibleSpace, flexibleSpace, doneButton], animated: false)
        return toolBar
    }
    @objc func doneClickedTextFieldToolBar(){
        print("here")
        self.vie.endEditing(true)
    }
}
