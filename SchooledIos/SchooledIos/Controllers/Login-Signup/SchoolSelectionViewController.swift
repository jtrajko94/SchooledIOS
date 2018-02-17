//
//  SchoolSelectionViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/13/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SchoolSelectionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
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
    
    @IBOutlet weak var _userTypeTextField: UITextField!
    let userTypePickerView = UIPickerView()
    
    @IBOutlet weak var _finishSchoolSelectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates
        statePickerView.delegate = self
        schoolTypePickerView.delegate = self
        schoolPickerView.delegate = self
        userTypePickerView.delegate = self
    
        //make toolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SchoolSelectionViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        //Link the text fields with the UIPickerViews
        _stateSelectionTextField.inputView = statePickerView
        _stateSelectionTextField.inputAccessoryView = toolBar
        
        _schoolTypeTextField.inputView = schoolTypePickerView
        _schoolTypeTextField.inputAccessoryView = toolBar
        
        _schoolSelectionTextField.inputView = schoolPickerView
        _schoolSelectionTextField.inputAccessoryView = toolBar
        
        _userTypeTextField.inputView = userTypePickerView
        _userTypeTextField.inputAccessoryView = toolBar
        
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
        } else if(pickerView == userTypePickerView){
            return userTypes.count
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
        } else if(pickerView == userTypePickerView){
            selectedRow = row
            selectedField = _userTypeTextField
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == statePickerView){
            return states[row]
        } else if(pickerView == schoolTypePickerView){
            return schoolTypes[row]
        } else if(pickerView == schoolPickerView){
            return schools[row]
        } else if(pickerView == userTypePickerView){
            return userTypes[row]
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
        } else if(selectedField == _userTypeTextField){
            selectedField.text = userTypes[selectedRow]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
