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

        
        statePickerView.delegate = self
        statePickerView.dataSource = self
        
        schoolTypePickerView.delegate = self
        
        schoolPickerView.delegate = self
        
        userTypePickerView.delegate = self
    
        
        _stateSelectionTextField.inputView = statePickerView
        
        _schoolTypeTextField.inputView = schoolTypePickerView
        
        _schoolSelectionTextField.inputView = schoolPickerView
        
        _userTypeTextField.inputView = userTypePickerView
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _finishSchoolSelectionButton)
    }
    
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
            _stateSelectionTextField.text = states[row]
            _stateSelectionTextField.resignFirstResponder()
        } else if(pickerView == schoolTypePickerView){
            _schoolTypeTextField.text = schoolTypes[row]
            _schoolTypeTextField.resignFirstResponder()
        } else if(pickerView == schoolPickerView){
            _schoolSelectionTextField.text = schools[row]
            _schoolSelectionTextField.resignFirstResponder()
        } else if(pickerView == userTypePickerView){
            _userTypeTextField.text = userTypes[row]
            _userTypeTextField.resignFirstResponder()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
