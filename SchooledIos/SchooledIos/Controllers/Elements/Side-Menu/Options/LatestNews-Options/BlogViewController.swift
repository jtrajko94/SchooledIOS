//
//  BlogViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 3/10/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let posts = ["horse", "cat", "dog", "potato", "horse", "cat", "dog", "potato","horse", "cat", "dog", "potato"]
    
    @IBOutlet weak var _blogTableView: UITableView!
    
    override func viewDidLoad() {
        _blogTableView.delegate = self
        _blogTableView.dataSource = self
        
        _blogTableView.backgroundColor = UIColor.clear
        let bgView: UIImageView = UIImageView(image: UIImage(named: "background"))
        self.view.addSubview(bgView)
        self.view.bringSubview(toFront: _blogTableView)
        
        super.viewDidLoad()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = _blogTableView.dequeueReusableCell(withIdentifier: "postCell") as! BlogTableViewCell
        
        cell._cellView.layer.cornerRadius = cell._cellView.frame.height / 2
        
        cell._cellLabel.text = posts[indexPath.row]
        cell._cellImage.image = UIImage(named: "background")
        cell._cellImage.layer.cornerRadius = cell._cellImage.frame.height / 2
        
        return cell
    }
}
