//
//  SubjectsViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/17/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    @IBOutlet weak var _difficultySlider: UISlider!
    @IBOutlet weak var _coursesCollectionView: UICollectionView!
    
    //IDs is list of subject internal ids, Mappings maps those ids with icons
    //SQL will pull list of all ids, and create mapping url on collection view load
    var subjectIds : [String] = []
    var subjectMappings : [String:String] = [:]
    var courseIds : [String] = []
    var courseMappings : [String:String] = ["":"ticket"]
    var currentUser = ApiUserData.getCurrentUser()!
    
    //use this if a subject has been picked
    var subjectSelected = ""
    var difficulty = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _difficultySlider.maximumValue = 10
        _difficultySlider.minimumValue = 0
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self._difficultySlider.setValue(Float(self.currentUser.GameDifficulty), animated: true) },
                                   completion: nil)
        setSubjects()
    }
    
    func setSubjects(){
        //load screen
        let group = DispatchGroup()
        group.enter()
        
        ApiService.GetApiResponseData(url: ApiUrlService.GetSubjectById(id: "")){ response in
            if let response = response{
                if(response.status == "Success"){
                    let jsonData = response.description.data(using: .utf8)!
                    let json = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                    
                    self.subjectIds = []
                    self.subjectMappings = [:]
                    if let array = json as? NSArray {
                        for obj in array{
                            let apiSubjectData = ApiSubjectData(json: obj as! [String : Any])
                            self.subjectIds.append(apiSubjectData.SubjectRowKey)
                            self.subjectMappings[apiSubjectData.SubjectRowKey] = apiSubjectData.Image
                        }
                    }
                    self.subjectSelected = ""
                }
            }
            
            group.leave()
        }
        
        group.wait()
    }
    
    func setCourses(){
        //load screen
        let group = DispatchGroup()
        group.enter()
        
        ApiService.GetApiResponseData(url: ApiUrlService.GetCourseById(id: "")){ response in
            if let response = response{
                if(response.status == "Success"){
                    let jsonData = response.description.data(using: .utf8)!
                    let json = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                    
                    self.courseIds = [""]
                    self.courseMappings = ["":"https://schooled.blob.core.windows.net/schooled/course-images/back.png"]
                    if let array = json as? NSArray {
                        for obj in array{
                            let apiSubjectData = ApiCourseData(json: obj as! [String : Any])
                            self.courseIds.append(apiSubjectData.CourseRowKey)
                            self.courseMappings[apiSubjectData.CourseRowKey] = apiSubjectData.Image
                        }
                    }
                }
            }
            
            group.leave()
        }
        
        group.wait()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(subjectSelected != ""){
            return courseIds.count
        }
        return subjectIds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CoursesCollectionViewCell
        if(subjectSelected != ""){
            cell._cellButton.tag = indexPath.item
            let rowkey = courseIds[indexPath.item]
            let url = URL(string: courseMappings[rowkey]!)
            let data = try? Data(contentsOf: url!)
            cell._cellButton.setImage(UIImage(named: courseMappings[rowkey]!), for: UIControlState.normal)
            cell._cellButton.setImage(UIImage(data: data!), for: UIControlState.normal)
        } else {
            cell._cellButton.tag = indexPath.item
            let rowkey = subjectIds[indexPath.item]
            let url = URL(string: subjectMappings[rowkey]!)
            let data = try? Data(contentsOf: url!)
            cell._cellButton.setImage(UIImage(named: subjectMappings[rowkey]!), for: UIControlState.normal)
            cell._cellButton.setImage(UIImage(data: data!), for: UIControlState.normal)
            
        }
        cell._cellButton.addTarget(self, action: #selector(cellButtonClicked), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    @IBAction func cellButtonClicked(sender: AnyObject) -> Void {
        guard let button = sender as? UIButton else {
            return
        }
        
        if(subjectSelected != "" && button.tag == 0){
            subjectSelected = ""
            setSubjects()
            _coursesCollectionView.reloadData()
        }
        else if(subjectSelected == "" || button.tag == 0){
            subjectSelected = subjectIds[button.tag]
            setCourses()
            _coursesCollectionView.reloadData()
        }else{
            let newValue: Int = Int(round(_difficultySlider.value))
            if(newValue != currentUser.GameDifficulty){
                currentUser.GameDifficulty = newValue
                let encodedData = NSKeyedArchiver.archivedData(withRootObject: currentUser)
                UserDefaults.standard.set(encodedData, forKey: "CurrentUser")
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try? jsonEncoder.encode(currentUser)
                let jsonString = String(data: jsonData!, encoding: .utf8)
                
                //TODO: This should update user record. Password should not be needed if you merge. 
                ApiService.GetApiResponseData(url: ApiUrlService.MergeUser(userJson: jsonString!)){_ in }
            }
            
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
