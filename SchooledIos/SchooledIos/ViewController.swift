//
//  ViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/10/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SignInWithEmailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Update Button Style
        SignInWithEmailButton.layer.borderWidth = 2
        SignInWithEmailButton.layer.borderColor = UIColor.white.cgColor
        SignInWithEmailButton.layer.shadowColor = UIColor.black.cgColor
        SignInWithEmailButton.layer.shadowOffset = CGSize(width: 0.25, height: 0.25)
        SignInWithEmailButton.layer.shadowOpacity = 1.0
        SignInWithEmailButton.layer.shadowRadius = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

