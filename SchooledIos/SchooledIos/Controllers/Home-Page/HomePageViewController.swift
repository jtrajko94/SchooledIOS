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
    @IBOutlet weak var _raffelTicketsLabel: UILabel!
    @IBOutlet weak var _schoolRankLabel: UILabel!
    @IBOutlet weak var _raffelTicketNumberLabel: UILabel!
    @IBOutlet weak var _schoolRankNumberLabel: UILabel!
    @IBOutlet weak var _personalPrizeLabel: UILabel!
    @IBOutlet weak var _schoolPrizeLabel: UILabel!
    @IBOutlet weak var _personalPrizeDaysLabel: UILabel!
    @IBOutlet weak var _schoolPrizeDaysLabel: UILabel!
    @IBOutlet weak var _quickPlayButton: UIButton!
    @IBOutlet weak var _playButton: UIButton!
    @IBOutlet weak var _personalPrizeView: UIView!
    @IBOutlet weak var _schoolPrizeView: UIView!
    @IBOutlet weak var _schoolRankView: UIView!
    @IBOutlet weak var _raffelTicketView: UIView!
    
    @IBAction func onSideBarClicked(){
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _quickPlayButton)
        buttonStyling.defaultStyling(button: _playButton)
        
        _raffelTicketView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        _personalPrizeView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        _schoolRankView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        _schoolPrizeView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        let labelStyling = LabelStyling();
        labelStyling.defaultStyling(label: _raffelTicketsLabel, fontSize: 17)
        labelStyling.defaultStyling(label: _schoolRankLabel, fontSize: 17)
        labelStyling.defaultStyling(label: _raffelTicketNumberLabel, fontSize: 25)
        labelStyling.defaultStyling(label: _schoolRankNumberLabel, fontSize: 25)
        labelStyling.defaultStyling(label: _personalPrizeLabel, fontSize: 17)
        labelStyling.defaultStyling(label: _schoolPrizeLabel, fontSize: 17)
        labelStyling.defaultStyling(label: _personalPrizeDaysLabel, fontSize: 17)
        labelStyling.defaultStyling(label: _schoolPrizeDaysLabel, fontSize: 17)
        
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
