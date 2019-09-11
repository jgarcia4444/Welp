//
//  RegisterViewController.swift
//  Welp
//
//  Created by Jake Garcia on 9/5/19.
//  Copyright © 2019 Jake Garcia. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var agePicker: UIPickerView!
    
    var usersAge: Int?
    var agePickerContent = [Int]()
    
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
        
        if age >= 21 {
            
            if password == confirmPassword {
                Auth.auth().createUser(withEmail: userEmail, password: password) { (authResult, error) in
                    
                    if error != nil {
                        print("Error creating new user in firebase: \(error!)")
                    } else {
                        self.performSegue(withIdentifier: "goToHomepage", sender: Any?.self)
                    }
                }
            } else {
                let alert = createAlert(errorMessage: "Oops, your passwords didn't quite match.")
                present(alert, animated: true)
            }
            
            
        } else {
            let alert = createAlert(errorMessage: "Sorry, you must be 21 years old to use this app.")
            present(alert, animated: true)
        }
        
    }

}

// MARK: - UI Functions

// create an alert function

func createAlert(errorMessage: String) -> UIAlertController {
    
    let alert = UIAlertController(title: "Access Denied", message: errorMessage, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .cancel) { (alertAction) in
        alert.dismiss(animated: true, completion: nil)
    }
    
    alert.addAction(action)
    
    return alert
    
}
