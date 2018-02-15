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
        case 1: NotificationCenter.default.post(name: NSNotification.Name("ShowSettings"), object: nil)
        default: break
        }
    }
}
