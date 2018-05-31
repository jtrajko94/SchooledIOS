//
//  SignUpViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/11/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var _signUpButton: UIButton!
    @IBOutlet weak var _firstNameTextField: UITextField!
    @IBOutlet weak var _lastNameTextField: UITextField!
    @IBOutlet weak var _eMailTextField: UITextField!
    @IBOutlet weak var _passwordTextField: UITextField!
    @IBOutlet weak var _passwordConfirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _signUpButton)

        //Toolbar Setup
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneToolBarClicked))
        toolBar.setItems([flexibleSpace, flexibleSpace, doneButton], animated: false)
        _firstNameTextField.inputAccessoryView = toolBar
        _lastNameTextField.inputAccessoryView = toolBar
        _eMailTextField.inputAccessoryView = toolBar
        _passwordTextField.inputAccessoryView = toolBar
        _passwordConfirmTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneToolBarClicked(){
        view.endEditing(true)
    }
    
    @IBAction func SignUp(_ sender: Any){
        let signUpUser = ApiUserData()
        removeErrorStyling()
        
        signUpUser.FirstName = _firstNameTextField.text!
        signUpUser.LastName = _lastNameTextField.text!
        signUpUser.Email = _eMailTextField.text!
        signUpUser.Password = _passwordTextField.text!
        let retypepassword = _passwordConfirmTextField.text
        
        let validUser = validateSignUpDetails(user: signUpUser, retypePassword: retypepassword!)
        
        if(validUser){
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: signUpUser)
            UserDefaults.standard.set(encodedData, forKey: "SignUpUser")
            
            self.performSegue(withIdentifier: "signUpMainSegue", sender: self._signUpButton)
        }
    }
    
    func validateSignUpDetails(user: ApiUserData, retypePassword: String) -> Bool{
        var isValid = true
        var errorMessage = ""
        
        if(user.FirstName.isEmpty){
            isValid = false
            errorMessage += "Please enter your first name. \n"
            TextFieldStyling.errorStyling(textField: _firstNameTextField)
        }
        if(user.LastName.isEmpty){
            isValid = false
            errorMessage += "Please enter your last name. \n"
            TextFieldStyling.errorStyling(textField: _lastNameTextField)
        }
        if(user.Email.isEmpty){
            isValid = false
            errorMessage += "Please enter your email. \n"
            TextFieldStyling.errorStyling(textField: _eMailTextField)
        }else{
            //TODO make this await
            let group = DispatchGroup()
            group.enter()
            
            ApiService.GetApiResponseData(url: ApiUrlService.GetUserByEmail(email: _eMailTextField.text!)){ response in
                if let response = response{
                    if(response.status == "Success" && TextMethods.IsApiDescriptionValid(text: response.description)){
                        isValid = false
                        errorMessage += "Please enter a new email. An account exists already with this one. \n"
                        TextFieldStyling.errorStyling(textField: self._eMailTextField)
                    }
                }
                
                group.leave()
            }
            
            group.wait()
        }
        
        if(!TextMethods.IsPasswordValid(text: user.Password)){
            isValid = false
            errorMessage += "Password needs to be at least 6 characters. \n"
            TextFieldStyling.errorStyling(textField: _passwordTextField)
        }else{
            if(user.Password != retypePassword){
                isValid = false
                errorMessage += "Passwords don't match. \n"
                TextFieldStyling.errorStyling(textField: _passwordConfirmTextField)
            }
        }
        
        if(!errorMessage.isEmpty){
            let alert = UIAlertController(title: "Need more information!", message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated:true)
        }
        return isValid
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    func removeErrorStyling(){
        TextFieldStyling.removeErrorStyling(textField: _firstNameTextField)
        TextFieldStyling.removeErrorStyling(textField: _lastNameTextField)
        TextFieldStyling.removeErrorStyling(textField: _eMailTextField)
        TextFieldStyling.removeErrorStyling(textField: _passwordTextField)
        TextFieldStyling.removeErrorStyling(textField: _passwordConfirmTextField)
    }
}
