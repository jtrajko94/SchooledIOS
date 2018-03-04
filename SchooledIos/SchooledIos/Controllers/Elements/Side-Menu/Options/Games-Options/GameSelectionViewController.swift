//
//  GameSelectionViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/18/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class GameSelectionViewController: UIViewController {

     var courseId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "gameSelectionSegue"){
            guard let button = sender as? UIButton else {
                return
            }
            courseId = button.tag
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
