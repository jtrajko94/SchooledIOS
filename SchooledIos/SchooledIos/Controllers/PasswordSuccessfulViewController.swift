//
//  PasswordSuccessfulViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/16/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class PasswordSuccessfulViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
