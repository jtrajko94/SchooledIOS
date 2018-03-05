//
//  GameSelectionViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/18/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class GameSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //This will be updated on load to the course selected
    var courseId: Int = 0
    var difficulty: Int = 0
    
    let list = ["Game 1", "Game 2", "Game 3", "Game 4", "Game 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(courseId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "gameCell")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(list[indexPath.row])
    }
}
