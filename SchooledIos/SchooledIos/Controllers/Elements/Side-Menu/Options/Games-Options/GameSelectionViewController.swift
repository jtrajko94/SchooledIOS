//
//  GameSelectionViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/18/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class GameSelectionViewController: UIViewController {

    //This will be updated on load to the course selected
    var courseId: Int = 0
    var difficulty: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(courseId)
    }
}
