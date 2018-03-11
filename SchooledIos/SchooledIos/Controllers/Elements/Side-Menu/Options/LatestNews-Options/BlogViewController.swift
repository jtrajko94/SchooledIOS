//
//  BlogViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 3/10/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let posts = ["This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!","This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!", "This is a blog post. Have fun reading this. Or not...it's really up to you dude. But let me know if it looks good. Thanks!"]
    
    @IBOutlet weak var _blogTableView: UITableView!
    
    override func viewDidLoad() {
        _blogTableView.delegate = self
        _blogTableView.dataSource = self
        
        super.viewDidLoad()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = _blogTableView.dequeueReusableCell(withIdentifier: "postCell") as! BlogTableViewCell
        
        cell._cellView.layer.cornerRadius = cell._cellView.frame.height / 2
        
        cell._cellPostTextView.text = posts[indexPath.row]
        cell._cellPostTextView.scrollRangeToVisible(NSRange(location:0, length:0))
        cell._cellPostTextView.isEditable = false
        cell._cellImage.image = UIImage(named: "present")
        cell._cellImage.layer.cornerRadius = cell._cellImage.frame.height / 2
        
        return cell
    }
}
