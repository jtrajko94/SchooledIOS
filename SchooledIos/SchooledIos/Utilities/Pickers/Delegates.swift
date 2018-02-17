//
//  Delegates.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/17/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation
import UIKit

class StatePickerDelegate: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    var states = ["Alabama", "Georgia", "Illinois", "Wyoming"]

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
}

class SchoolTypePickerDelegate: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    let schoolTypes = ["Elementary School", "Middle School", "High School"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return schoolTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return schoolTypes[row]
    }
}

class SchoolPickerDelegate: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    let schools = ["Glenbard East", "Addison Trail"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return schools.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return schools[row]
    }
}

class UserTypePickerDelegate: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    let userTypes = ["Elementary Student", "Middle School Student", "High School Student", "Parent", "Other"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userTypes[row]
    }
}
