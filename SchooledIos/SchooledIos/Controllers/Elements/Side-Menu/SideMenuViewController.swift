//
//  SideMenuViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/13/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
    
    @IBOutlet var _sideMenuTableView: UITableView!
    @IBOutlet weak var _gamesLabel: UILabel!
    @IBOutlet weak var _settingsLabel: UILabel!
    @IBOutlet weak var _leaderboardsLabel: UILabel!
    @IBOutlet weak var _competitionsLabel: UILabel!
    @IBOutlet weak var _latestNewsLabel: UILabel!
    @IBOutlet weak var _helpLabel: UILabel!
    @IBOutlet weak var _logOutLabel: UILabel!
    
    override func viewDidLoad() {
        _sideMenuTableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        setLabelStyling()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
        switch indexPath.row {
        case 0: NotificationCenter.default.post(name: NSNotification.Name("ShowGames"), object: nil)
        case 1: NotificationCenter.default.post(name: NSNotification.Name("ShowSettings"), object: nil)
        case 2: NotificationCenter.default.post(name: NSNotification.Name("ShowLeaderboards"), object: nil)
        case 3: NotificationCenter.default.post(name: NSNotification.Name("ShowCompetitions"), object: nil)
        case 4: NotificationCenter.default.post(name: NSNotification.Name("ShowBlogs"), object: nil)
        case 5: NotificationCenter.default.post(name: NSNotification.Name("ShowHelp"), object: nil)
        default: break
        }
    }
    
    func setLabelStyling(){
        LabelStyling.defaultStyling(label: _gamesLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _settingsLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _leaderboardsLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _competitionsLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _latestNewsLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _helpLabel, fontSize: 20)
        LabelStyling.defaultStyling(label: _logOutLabel, fontSize: 20)
    }
}
