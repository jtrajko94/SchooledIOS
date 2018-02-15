//
//  LoginViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/11/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var _registerButton: UIButton!
    @IBOutlet weak var _loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _loginButton)
        buttonStyling.defaultStyling(button: _registerButton)
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
