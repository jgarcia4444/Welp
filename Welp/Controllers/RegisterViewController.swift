//
//  RegisterViewController.swift
//  Welp
//
//  Created by Jake Garcia on 9/5/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth
import RealmSwift

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var agePicker: UIPickerView!
    
    var usersAge: Int?
    var agePickerContent = [Int]()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        // Do any additional setup after loading the view.
        populateDataSource()
        agePicker.delegate = self
        agePicker.dataSource = agePickerContent as? UIPickerViewDataSource
        
    }
    
    // Populate the age picker content array
    
    func populateDataSource() {
        for i in 1...81 {
            agePickerContent.append(i)
        }
    }
    
    // MARK: - Picker View Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%i", row + 1)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        usersAge = agePickerContent[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        authenticateUserInfo()
        
    }
    
    // MARK: - UI Functions
    
    // create an alert function
    
    func createAlert(errorMessage: String) {
        
        let alert = UIAlertController(title: "Access Denied", message: errorMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel) { (alertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    func authenticateUserInfo() {
        
        guard let userEmail = emailTextField.text else {
            fatalError("An email was not given")
        }
        guard let password = passwordTextField.text else {
            fatalError("A password was not given")
        }
        guard let confirmPassword = confirmPasswordTextField.text else {
            fatalError("No confirm password was given")
        }
        guard let fName = firstNameTextField.text else {
            fatalError("A first name was not given")
        }
        guard let lName = lastNameTextField.text else {
            fatalError("A last name was not given")
        }
        guard let age = usersAge else {
            fatalError("No age was selected")
        }
        if password.count < 8 {
            createAlert(errorMessage: "Your password must be a minimum of 8 characters long")
        } else {
            if age >= 21 {
                
                if password == confirmPassword {
                    Auth.auth().createUser(withEmail: userEmail, password: password) { (authResult, error) in
                        
                        if error != nil {
                            print("Error creating new user in firebase: \(error!)")
                        } else {
                            self.performSegue(withIdentifier: "goToHomepage", sender: Any?.self)
                        }
                    }
                    
                    let user = User()
                    user.email = userEmail
                    user.password = password
                    user.fName = fName
                    user.lName = lName
                    user.age = age
                    
                    do {
                        try realm.write {
                            realm.add(user)
                        }
                    } catch {
                        fatalError("Unable to save the users info locally")
                    }
                    
                } else {
                    createAlert(errorMessage: "Oops, your passwords didn't quite match.")
                }
                
                
            } else {
                createAlert(errorMessage: "Sorry, you must be 21 years old to use this app.")
            }
        }
        
        
    }

}


