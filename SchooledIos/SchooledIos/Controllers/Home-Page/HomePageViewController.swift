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
    
    var currentUser = ApiUserData.getCurrentUser()!
    
    @IBAction func onSideBarClicked(){
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _quickPlayButton)
        buttonStyling.defaultStyling(button: _playButton)
        
        setLabelStyling()
        
        _raffelTicketView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        _personalPrizeView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        _schoolRankView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        _schoolPrizeView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name("ShowSettings"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showGames), name: NSNotification.Name("ShowGames"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showLeaderboards), name: NSNotification.Name("ShowLeaderboards"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showCompetitions), name: NSNotification.Name("ShowCompetitions"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showBlogs), name: NSNotification.Name("ShowBlogs"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showHelp), name: NSNotification.Name("ShowHelp"), object: nil)
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
    
    @objc func showCompetitions(){
        performSegue(withIdentifier: "ShowCompetitions", sender: nil)
    }
    
    @objc func showBlogs(){
        performSegue(withIdentifier: "ShowBlogs", sender: nil)
    }
    
    @objc func showHelp(){
        performSegue(withIdentifier: "ShowHelp", sender: nil)
    }
    
    func setLabelStyling(){
        LabelStyling.defaultStyling(label: _raffelTicketsLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _schoolRankLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _raffelTicketNumberLabel, fontSize: 40)
        LabelStyling.defaultStyling(label: _schoolRankNumberLabel, fontSize: 40)
        LabelStyling.defaultStyling(label: _personalPrizeLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _schoolPrizeLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _personalPrizeDaysLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _schoolPrizeDaysLabel, fontSize: 20)
    }
}
