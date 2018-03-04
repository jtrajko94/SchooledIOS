//
//  SubjectsViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/17/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    @IBOutlet weak var _coursesCollectionView: UICollectionView!
    //These are the subjects. Initially loaded, get from SQL
    let subjects = ["Math", "Science", "English"]
    
    //These are loaded after picking a subject, get from SQL
    let courses = ["Back", "Algebra", "ICA", "Geometry", "Calculus"]
    
    //use this if a subject has been picked
    var subject = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(subject != ""){
            return courses.count
        }
        return subjects.count
    }
    
    //Change button based on the subject selected. The Subject titles should be the subject text for the courses, that you use to query in SQL
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CoursesCollectionViewCell
        if(subject != ""){
            cell._cellButton.setTitle(courses[indexPath.item], for: .normal)
            cell._cellButton.setImage(UIImage(named: "present"), for: UIControlState.normal)
        } else {
            cell._cellButton.setTitle(subjects[indexPath.item], for: .normal)
            cell._cellButton.setImage(UIImage(named: "prize"), for: UIControlState.normal)
        }
        
        cell._cellButton.addTarget(self, action: #selector(cellButtonClicked), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    @IBAction func cellButtonClicked(sender: AnyObject) -> Void {
        guard let button = sender as? UIButton else {
            return
        }

        subject = button.title(for: .normal)!
        _coursesCollectionView.reloadData()
    }
}
