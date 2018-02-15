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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _signUpButton)
    }
}
