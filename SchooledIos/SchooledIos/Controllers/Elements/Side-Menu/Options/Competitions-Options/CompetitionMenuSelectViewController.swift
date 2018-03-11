//
//  CompetitionMenuSelectViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 3/10/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class CompetitionMenuSelectViewController: UIViewController {

    @IBOutlet weak var _schoolButton: UIButton!
    @IBOutlet weak var _individualButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _schoolButton)
        buttonStyling.defaultStyling(button: _individualButton)
    }
}
