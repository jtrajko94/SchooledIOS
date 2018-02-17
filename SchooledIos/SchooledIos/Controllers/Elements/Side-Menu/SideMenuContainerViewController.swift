//
//  SideMenuContainerViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/14/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SideMenuContainerViewController: UIViewController {
    
    @IBOutlet weak var _sideMenuOffsetConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
    }
    
    @objc func toggleSideMenu(){
        if sideMenuOpen {
            sideMenuOpen = false
            _sideMenuOffsetConstraint.constant = -200
        } else {
            sideMenuOpen = true
            _sideMenuOffsetConstraint.constant = 0
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
