//
//  StatePickerDelegate.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/17/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation
import UIKit

class NamePickerDelegate: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    let names = ["Mo", "Larry", "Curley"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[row]
    }
}
