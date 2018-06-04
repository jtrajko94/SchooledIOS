//
//  SchoolSelectionViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/13/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SchoolSelectionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    let schoolTypes = ["Elementary School", "Middle School", "High School"]
    var schools: [String] = []
    let userTypes = ["Elementary Student", "Middle School Student", "High School Student", "College Student", "Parent", "Other"]
    var schoolHash: [String: String] = [:]
    var schoolTypeHash: [String: String] = [
        "Elementary School" : "2236D1C5-EF70-4559-9F57-B37E49EAF814",
        "Middle School" : "0E48E3B7-93CF-4C31-A1E9-869AB92AB548",
        "High School" : "FE3B2875-D634-462B-9EAB-B0959594781E"
    ]
    var userTypeHash: [String: String] = [
        "Elementary School Student" : "8597B5A9-E9C0-4650-B934-7D86D0FB2BDD",
        "Middle School Student" : "DEC3641D-0CAE-499F-932F-4EA018C2C717",
        "High School Student" : "6047EA7C-CE2E-4DE9-9006-04A86F6BCC71",
        "Parent" : "80F29099-BA48-4239-B924-20AA3AA5DDC1",
        "Other" : "02297A25-DAD1-4376-9E23-2261C4702153",
        "College Student" : "775D4CB6-EDC2-4168-B5B6-8D1B944178F6"
    ]
    
    
    var selectedState = ""
    var selectedSchoolType = ""
    var selectedSchool = ""
    var userType = ""
    
    var signUpUser = ApiUserData()
    
    var selectedField = UITextField()
    var selectedRow = 0

    @IBOutlet weak var _stateSelectionTextField: UITextField!
    let statePickerView = UIPickerView()
    
    @IBOutlet weak var _schoolTypeTextField: UITextField!
    let schoolTypePickerView = UIPickerView()
    
    @IBOutlet weak var _schoolSelectionTextField: UITextField!
    let schoolPickerView = UIPickerView()
    
    @IBOutlet weak var _userTypeTextField: UITextField!
    let userTypePickerView = UIPickerView()
    
    @IBOutlet weak var _finishSchoolSelectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates
        statePickerView.delegate = self
        schoolTypePickerView.delegate = self
        schoolPickerView.delegate = self
        userTypePickerView.delegate = self
    
        //make toolbar
        let toolBar = setUpToolbar()
        
        //Setup textfields
        setUpPickerTextFields(_stateSelectionTextField, statePickerView, toolBar)
        setUpPickerTextFields(_schoolTypeTextField, schoolTypePickerView, toolBar)
        setUpPickerTextFields(_schoolSelectionTextField, schoolPickerView, toolBar)
        setUpPickerTextFields(_userTypeTextField, userTypePickerView, toolBar)
        
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _finishSchoolSelectionButton)
        
        signUpUser = getSignUpUser()!
        if(signUpUser.FirstName != ""){
            ButtonStyling.disableButton(button: _finishSchoolSelectionButton)
            TextFieldStyling.disableTextField(textField: _schoolTypeTextField)
            TextFieldStyling.disableTextField(textField: _schoolSelectionTextField)
            TextFieldStyling.disableTextField(textField: _userTypeTextField)
        }else{
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func schoolTypeSelectionDidChange(_ textField: UITextField) {
        //if new change different, disable kind of studnet and finish. If empty, do nothing
        //if same do nothing
    }
    
    @objc func schoolSelectionDidChange(_ textField: UITextField) {
        
    }
    
    //Picker View Delegate functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == statePickerView){
            return states.count
        } else if(pickerView == schoolTypePickerView){
            return schoolTypes.count
        } else if(pickerView == schoolPickerView){
            return schools.count
        } else if(pickerView == userTypePickerView){
            return userTypes.count
        }
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == statePickerView){
            selectedRow = row
            selectedField = _stateSelectionTextField
        } else if(pickerView == schoolTypePickerView){
            selectedRow = row
            selectedField = _schoolTypeTextField
        } else if(pickerView == schoolPickerView){
            selectedRow = row
            selectedField = _schoolSelectionTextField
        } else if(pickerView == userTypePickerView){
            selectedRow = row
            selectedField = _userTypeTextField
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == statePickerView){
            return states[row]
        } else if(pickerView == schoolTypePickerView){
            return schoolTypes[row]
        } else if(pickerView == schoolPickerView){
            return schools[row]
        } else if(pickerView == userTypePickerView){
            return userTypes[row]
        }
        return "Error"
    }
    
    //Toolbar functions
    @objc func donePicker() {
        selectedField.resignFirstResponder()
        if(selectedField == _stateSelectionTextField){
            selectedField.text = states[selectedRow]
            if(!(selectedField.text?.isEmpty)! && selectedField.text != selectedState){
                ButtonStyling.disableButton(button: _finishSchoolSelectionButton)
                TextFieldStyling.enableTextField(textField: _schoolTypeTextField)
                _schoolTypeTextField.text = ""
                TextFieldStyling.disableTextField(textField: _schoolSelectionTextField)
                _schoolSelectionTextField.text = ""
                TextFieldStyling.disableTextField(textField: _userTypeTextField)
                 _userTypeTextField.text = ""
                selectedState = selectedField.text!
            }
            
        } else if(selectedField == _schoolTypeTextField){
            selectedField.text = schoolTypes[selectedRow]
            if(!(selectedField.text?.isEmpty)! && selectedField.text != selectedSchoolType){
                ButtonStyling.disableButton(button: _finishSchoolSelectionButton)
                TextFieldStyling.disableTextField(textField: _userTypeTextField)
                 _userTypeTextField.text = ""
                selectedSchoolType = selectedField.text!
                
                //load screen
                let group = DispatchGroup()
                group.enter()
                
                ApiService.GetApiResponseData(url: ApiUrlService.GetSchoolScoreBySearch(schoolTypeId: schoolTypeHash[_schoolTypeTextField.text!]!, name: "", state: _stateSelectionTextField.text!, district: "", country: "")){ response in
                    if let response = response{
                        if(response.status == "Success" && TextMethods.IsApiDescriptionValid(text: response.description)){
                            let jsonData = response.description.data(using: .utf8)!
                            let json = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                            
                            if let array = json as? NSArray {
                                self.schools = []
                                self.schoolHash = [:]
                                for obj in array{
                                    let apiSchoolData = ApiSchoolData(json: obj as! [String : Any])
                                    self.schools.append(apiSchoolData.Name)
                                    self.schoolHash[apiSchoolData.Name] = apiSchoolData.SchoolRowKey
                                }
                            }
                            
                        }
                    }
                    group.leave()
                }
                
                group.wait()
                if(schools.isEmpty){
                    let alert = UIAlertController(title: "Don't see your school?", message: "You can't SCHOOL this school yet. Let us know to add it!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated:true)
                }else{
                    TextFieldStyling.enableTextField(textField: _schoolSelectionTextField)
                    _schoolSelectionTextField.text = ""
                    schoolPickerView.reloadAllComponents();
                }
            }
            
        } else if(selectedField == _schoolSelectionTextField){
            selectedField.text = schools[selectedRow]
            if(!(selectedField.text?.isEmpty)! && selectedField.text != selectedSchool){
                ButtonStyling.disableButton(button: _finishSchoolSelectionButton)
                TextFieldStyling.enableTextField(textField: _userTypeTextField)
                _userTypeTextField.text = ""
                selectedSchool = selectedField.text!
            }
        } else if(selectedField == _userTypeTextField){
            selectedField.text = userTypes[selectedRow]
            if(!(selectedField.text?.isEmpty)!){
                ButtonStyling.enableButton(button: _finishSchoolSelectionButton)
            }
        }
    }
    
    //Set default selected text field
    @objc func setBaseTextFieldOnClick(textField: UITextField) {
        selectedField = textField
    }
    
    func setUpPickerTextFields(_ textField: UITextField, _ picker: UIPickerView, _ toolBar: UIToolbar){
        textField.addTarget(self, action: #selector(setBaseTextFieldOnClick), for: UIControlEvents.touchDown)
        textField.inputView = picker
        textField.inputAccessoryView = toolBar
    }
    
    func setUpToolbar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SchoolSelectionViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    func getSignUpUser() -> ApiUserData?{
        if let data = UserDefaults.standard.data(forKey: "SignUpUser"),
            let dataUser = NSKeyedUnarchiver.unarchiveObject(with: data) as? ApiUserData
        {
            return dataUser
        }
        return nil
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    @IBAction func doFinish(_ sender: Any) {
        signUpUser.SchoolRowKey = schoolHash[_schoolSelectionTextField.text!]!
        signUpUser.UserTypeRowKey = userTypeHash[_userTypeTextField.text!]!
        var finished = false
        //load screen
        let group = DispatchGroup()
        group.enter()
        
        let jsonEncoder = JSONEncoder()
        do{
            let jsonData = try jsonEncoder.encode(signUpUser)
            let jsonString = String(data: jsonData, encoding: .utf8)

            ApiService.GetApiResponseData(url: ApiUrlService.MergeUser(userJson: jsonString!)){ response in
                if let response = response{
                    if(response.status == "Success" && TextMethods.IsApiDescriptionValid(text: response.description)){
                        self.signUpUser.Password = "";
                        let encodedData = NSKeyedArchiver.archivedData(withRootObject: self.signUpUser)
                        UserDefaults.standard.set(encodedData, forKey: "CurrentUser")
                        UserDefaults.standard.set(nil, forKey: "SignUpUser")
                        finished = true
                        self.performSegue(withIdentifier: "signUpSchoolSegue", sender: self._finishSchoolSelectionButton)
                    }
                }
                group.leave()
            }
        }catch {
            let alert = UIAlertController(title: "Something went wrong!", message: "Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated:true)
            
            group.leave()
        }
        
        group.wait()
        
        if(finished){
            self.performSegue(withIdentifier: "signUpSchoolSegue", sender: self._finishSchoolSelectionButton)
        }
    }
}
