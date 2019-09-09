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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        // Do any additional setup after loading the view.
        
        agePicker.delegate = self
        agePicker.dataSource = self
        
    }
    
    // MARK: - Picker View Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%i", row + 18)
    }
    
    
    

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        guard let userEmail = emailTextField.text else {
            fatalError("An email was not given")
        }
        guard let password = passwordTextField.text else {
            fatalError("A password was not given")
        }
        
        guard let fName = firstNameTextField.text else {
            fatalError("A first name was not given")
        }
        
        guard let lName = lastNameTextField.text else {
            fatalError("A last name was not given")
        }
        
    }

}
