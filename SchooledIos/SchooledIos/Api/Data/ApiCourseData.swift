//
//  ApiCourseData.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 5/19/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import Foundation

class ApiCourseData: NSObject, NSCoding{
    var CourseRowKey: String = ""
    var SubjectRowKey: String = ""
    var Name: String = ""
    var Image: String = ""
    
    override init(){
        CourseRowKey = ""
        SubjectRowKey = ""
        Name = ""
        Image = ""
    }
    
    required init(coder decoder: NSCoder) {
        self.CourseRowKey = decoder.decodeObject(forKey: "CourseRowKey") as? String ?? ""
        self.SubjectRowKey = decoder.decodeObject(forKey: "SubjectRowKey") as? String ?? ""
        self.Name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.Image = decoder.decodeObject(forKey: "Image") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(CourseRowKey, forKey: "CourseRowKey")
        coder.encode(SubjectRowKey, forKey: "SubjectRowKey")
        coder.encode(Name, forKey: "Name")
        coder.encode(Image, forKey: "Image")
    }
    
    init(json: [String: Any]){
        CourseRowKey = json["CourseRowKey"] as? String ?? ""
        SubjectRowKey = json["SubjectRowKey"] as? String ?? ""
        Name = json["Name"] as? String ?? ""
        Image = json["Image"] as? String ?? ""
    }
}
