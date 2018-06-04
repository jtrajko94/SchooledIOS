//
//  ViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/10/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var _signInWithEmailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _signInWithEmailButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        if(ApiUserData.getCurrentUser() != nil){
            self.performSegue(withIdentifier: "loggedUserSegue", sender: self)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

