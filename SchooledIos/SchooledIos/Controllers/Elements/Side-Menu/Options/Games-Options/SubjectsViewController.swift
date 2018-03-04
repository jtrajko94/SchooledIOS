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
    //IDs is list of subject internal ids, Mappings maps those ids with icons
    //SQL will pull list of all ids, and create mapping url on collection view load
    let subjectIds = [1, 2, 3]
    let subjectMappings = [1: "prize", 2:"prize", 3:"prize"]
    let courseIds = [0,1,2,3,4,5]
    let courseMappings = [0:"ticket", 1: "present", 2:"present", 3:"present", 4: "present", 5: "present"]
    
    //use this if a subject has been picked
    var subjectSelected = 0
    let difficulty = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(subjectSelected != 0){
            return courseIds.count
        }
        return subjectIds.count
    }
    
    //Change button based on the subject selected. The Subject titles should be the subject text for the courses, that you use to query in SQL
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CoursesCollectionViewCell
        if(subjectSelected != 0){
            cell._cellButton.tag = courseIds[indexPath.item]
            cell._cellButton.setImage(UIImage(named: courseMappings[cell._cellButton.tag]!), for: UIControlState.normal)
        } else {
            cell._cellButton.tag = subjectIds[indexPath.item]
            cell._cellButton.setImage(UIImage(named: subjectMappings[cell._cellButton.tag]!), for: UIControlState.normal)
        }
        
        cell._cellButton.addTarget(self, action: #selector(cellButtonClicked), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    @IBAction func cellButtonClicked(sender: AnyObject) -> Void {
        guard let button = sender as? UIButton else {
            return
        }
        
        if(subjectSelected == 0 || button.tag == 0){
            subjectSelected = button.tag
            _coursesCollectionView.reloadData()
        }else{
            performSegue(withIdentifier: "gameSelectionSegue", sender: button)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if(segue.identifier == "gameSelectionSegue"){
            guard let button = sender as? UIButton else {
                return
            }
            let destinationVC = segue.destination as! GameSelectionViewController
            destinationVC.courseId = button.tag
            destinationVC.difficulty = difficulty
        }
    }
}
