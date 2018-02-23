//
//  ResetPasswordFormViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/16/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class ResetPasswordFormViewController: UIViewController {

    @IBOutlet weak var _resetPasswordButton: UIButton!
    @IBOutlet weak var _temporaryPasswordTextField: UITextField!
    @IBOutlet weak var _passwordTextField: UITextField!
    @IBOutlet weak var _confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _resetPasswordButton)
        
        //Toolbar Setup
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneToolBarClicked))
        toolBar.setItems([flexibleSpace, flexibleSpace, doneButton], animated: false)
        _temporaryPasswordTextField.inputAccessoryView = toolBar
        _passwordTextField.inputAccessoryView = toolBar
        _confirmPasswordTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneToolBarClicked(){
        view.endEditing(true)
    }
}
