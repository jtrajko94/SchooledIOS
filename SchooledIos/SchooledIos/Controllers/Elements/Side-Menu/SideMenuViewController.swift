//
//  SideMenuViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/13/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
    
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
}
