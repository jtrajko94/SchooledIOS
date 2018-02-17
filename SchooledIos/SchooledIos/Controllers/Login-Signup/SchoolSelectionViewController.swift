//
//  SchoolSelectionViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/13/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SchoolSelectionViewController: UIViewController{

    @IBOutlet weak var _stateSelectionTextField: UITextField!
    let statesSelectionDelegate = StatePickerDelegate()
    
    @IBOutlet weak var _schoolTypeTextField: UITextField!
    let schoolTypeDelegate = SchoolTypePickerDelegate()
    
    @IBOutlet weak var _schoolSelectionTextField: UITextField!
    let schoolSelectionDelegate = SchoolPickerDelegate()
    
    @IBOutlet weak var _userTypeTextField: UITextField!
    let userTypeDelegate = UserTypePickerDelegate()
    
    @IBOutlet weak var _finishSchoolSelectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statePickerView = UIPickerView()
        statePickerView.delegate = statesSelectionDelegate
        
        let schoolTypePickerView = UIPickerView()
        schoolTypePickerView.delegate = schoolTypeDelegate
        
        let schoolPickerView = UIPickerView()
        schoolPickerView.delegate = schoolSelectionDelegate
        
        let userTypePickerView = UIPickerView()
        userTypePickerView.delegate = userTypeDelegate
    
        
        _stateSelectionTextField.inputView = statePickerView
        _schoolTypeTextField.inputView = schoolTypePickerView
        _schoolSelectionTextField.inputView = schoolPickerView
        _userTypeTextField.inputView = userTypePickerView
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _finishSchoolSelectionButton)
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
