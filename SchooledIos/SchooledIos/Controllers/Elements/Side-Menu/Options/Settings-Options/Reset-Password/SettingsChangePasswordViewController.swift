//
//  SettingsChangePasswordViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 3/3/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SettingsChangePasswordViewController: UIViewController {

    @IBOutlet weak var _currentPasswordTextField: UITextField!
    @IBOutlet weak var _newPasswordTextField: UITextField!
    @IBOutlet weak var _confirmPasswordTextField: UITextField!
    @IBOutlet weak var _updatePasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _updatePasswordButton)
    }
}
