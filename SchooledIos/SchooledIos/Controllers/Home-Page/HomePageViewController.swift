//
//  HomePageViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/13/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var _sideBarButton: UIBarButtonItem!
    
    @IBAction func onSideBarClicked(){
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name("ShowSettings"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showGames), name: NSNotification.Name("ShowGames"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showLeaderboards), name: NSNotification.Name("ShowLeaderboards"), object: nil)
    }
    
    @objc func showSettings(){
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
    
    @objc func showGames(){
        performSegue(withIdentifier: "ShowGames", sender: nil)
    }
    
    @objc func showLeaderboards(){
        performSegue(withIdentifier: "ShowLeaderboards", sender: nil)
    }
}
