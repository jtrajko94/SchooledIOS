//
//  ResetPasswordViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/16/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var _resetPassSubmitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _resetPassSubmitButton)
    }
}
