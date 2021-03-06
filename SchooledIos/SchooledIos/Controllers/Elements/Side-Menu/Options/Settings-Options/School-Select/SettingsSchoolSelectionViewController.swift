//
//  SettingsSchoolSelectionViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 3/3/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SettingsSchoolSelectionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let states = ["Alabama", "Georgia", "Illinois", "Wyoming"]
    let schoolTypes = ["Elementary School", "Middle School", "High School"]
    let schools = ["Glenbard East", "Addison Trail"]
    let userTypes = ["Elementary Student", "Middle School Student", "High School Student", "Parent", "Other"]
    
    var selectedField = UITextField()
    var selectedRow = 0
    
    @IBOutlet weak var _stateSelectionTextField: UITextField!
    let statePickerView = UIPickerView()
    
    @IBOutlet weak var _schoolTypeTextField: UITextField!
    let schoolTypePickerView = UIPickerView()
    
    @IBOutlet weak var _schoolSelectionTextField: UITextField!
    let schoolPickerView = UIPickerView()
    
    @IBOutlet weak var _finishSchoolSelectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates
        statePickerView.delegate = self
        schoolTypePickerView.delegate = self
        schoolPickerView.delegate = self
        
        //make toolbar
        let toolBar = setUpToolbar()
        
        //Setup textfields
        setUpPickerTextFields(_stateSelectionTextField, statePickerView, toolBar)
        setUpPickerTextFields(_schoolTypeTextField, schoolTypePickerView, toolBar)
        setUpPickerTextFields(_schoolSelectionTextField, schoolPickerView, toolBar)
        
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _finishSchoolSelectionButton)
    }
    
    //Picker View Delegate functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == statePickerView){
            return states.count
        } else if(pickerView == schoolTypePickerView){
            return schoolTypes.count
        } else if(pickerView == schoolPickerView){
            return schools.count
        }
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == statePickerView){
            selectedRow = row
            selectedField = _stateSelectionTextField
        } else if(pickerView == schoolTypePickerView){
            selectedRow = row
            selectedField = _schoolTypeTextField
        } else if(pickerView == schoolPickerView){
            selectedRow = row
            selectedField = _schoolSelectionTextField
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == statePickerView){
            return states[row]
        } else if(pickerView == schoolTypePickerView){
            return schoolTypes[row]
        } else if(pickerView == schoolPickerView){
            return schools[row]
        }
        return "Error"
    }
    
    //Toolbar functions
    @objc func donePicker() {
        selectedField.resignFirstResponder()
        if(selectedField == _stateSelectionTextField){
            selectedField.text = states[selectedRow]
        } else if(selectedField == _schoolTypeTextField){
            selectedField.text = schoolTypes[selectedRow]
        } else if(selectedField == _schoolSelectionTextField){
            selectedField.text = schools[selectedRow]
        }
    }
    
    //Set default selected text field
    @objc func setBaseTextFieldOnClick(textField: UITextField) {
        selectedField = textField
    }
    
    func setUpPickerTextFields(_ textField: UITextField, _ picker: UIPickerView, _ toolBar: UIToolbar){
        textField.addTarget(self, action: #selector(setBaseTextFieldOnClick), for: UIControlEvents.touchDown)
        textField.inputView = picker
        textField.inputAccessoryView = toolBar
    }
    
    func setUpToolbar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SchoolSelectionViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
}
