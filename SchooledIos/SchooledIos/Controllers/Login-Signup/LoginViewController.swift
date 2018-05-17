//
//  LoginViewController.swift
//  SchooledIos
//
//  Created by Jerun Trajko on 2/11/18.
//  Copyright © 2018 Jerun Trajko. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    @IBOutlet weak var _registerButton: UIButton!
    @IBOutlet weak var _loginButton: UIButton!
    @IBOutlet weak var _emailTextField: UITextField!
    @IBOutlet weak var _passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Apply Styling
        let buttonStyling = ButtonStyling();
        buttonStyling.defaultStyling(button: _loginButton)
        buttonStyling.defaultStyling(button: _registerButton)
        
        //Toolbar Setup
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneToolBarClicked))
        toolBar.setItems([flexibleSpace, flexibleSpace, doneButton], animated: false)
        _emailTextField.inputAccessoryView = toolBar
        _passwordTextField.inputAccessoryView = toolBar
        
    }
    
    @objc func doneToolBarClicked(){
        view.endEditing(true)
    }
    
    @IBAction func Login(_ sender: Any) {
        let username = _emailTextField.text;
        let password = _passwordTextField.text;
        
        TextFieldStyling.removeErrorStyling(textField: _emailTextField)
        TextFieldStyling.removeErrorStyling(textField: _passwordTextField)
        ButtonStyling.disableButton(button: _loginButton)
        
        if(username == "" || password == ""){
            TextFieldStyling.errorStyling(textField: _emailTextField)
            TextFieldStyling.errorStyling(textField: _passwordTextField)
            ButtonStyling.enableButton(button: _loginButton)
            
            let alert = UIAlertController(title: "Try Again!", message: "Please type an email and password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated:true)
            
            return
        }
        
        DoLogin(username!, password!)
    }
    
    func DoLogin(_ user:String, _ pass:String)
    {
        ApiService.GetApiResponseData(url: ApiUrlService.GetUserByLogin(user: user, pass: pass)){ response in
            if let response = response{
                if(response.status == "Success" && TextMethods.IsApiDescriptionValid(text: response.description)){
                    let jsonData = response.description.data(using: .utf8)!
                    let json = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                    let apiUserData = ApiUserData(json: json as! [String : Any])
                    
                    let encodedData = NSKeyedArchiver.archivedData(withRootObject: apiUserData)
                    UserDefaults.standard.set(encodedData, forKey: "CurrentUser")
                    
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "loginUserSegue", sender: self._loginButton)
                    }
                    
                }else if(response.status == "Success" && !TextMethods.IsApiDescriptionValid(text: response.description)){
                    DispatchQueue.main.async {
                        TextFieldStyling.errorStyling(textField: self._emailTextField)
                        TextFieldStyling.errorStyling(textField: self._passwordTextField)
                        ButtonStyling.enableButton(button: self._loginButton)
                    }
                    
                    let alert = UIAlertController(title: "Try Again!", message: "No user was found for that email and password.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated:true)
                }
            }
        }
    }
    
    func LoginToDo()
    {
        _emailTextField.isEnabled = true
        _passwordTextField.isEnabled = true
        
        _loginButton.setTitle("Login", for: .normal)
    }
    
    func LoginDone()
    {
        _emailTextField.isEnabled = false
        _passwordTextField.isEnabled = false
        
        _loginButton.setTitle("Logout", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
