//
//  SignUpViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/11/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var _signUpButton: UIButton!
    @IBOutlet weak var _firstNameTextField: UITextField!
    @IBOutlet weak var _lastNameTextField: UITextField!
    @IBOutlet weak var _eMailTextField: UITextField!
    @IBOutlet weak var _passwordTextField: UITextField!
    @IBOutlet weak var _passwordConfirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _signUpButton)

        //Toolbar Setup
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneToolBarClicked))
        toolBar.setItems([flexibleSpace, flexibleSpace, doneButton], animated: false)
        _firstNameTextField.inputAccessoryView = toolBar
        _lastNameTextField.inputAccessoryView = toolBar
        _eMailTextField.inputAccessoryView = toolBar
        _passwordTextField.inputAccessoryView = toolBar
        _passwordConfirmTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneToolBarClicked(){
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
}
