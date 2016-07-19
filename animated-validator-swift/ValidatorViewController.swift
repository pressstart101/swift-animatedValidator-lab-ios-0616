//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    

    
    var buttonConstraint = NSLayoutConstraint()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.enabled = false
        
        view.removeConstraints(view.constraints)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 50).active = true
        emailTextField.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        emailTextField.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.5).active = true
        
        
        emailConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
        emailConfirmationTextField.topAnchor.constraintEqualToAnchor(emailTextField.topAnchor, constant: 40).active = true
        emailConfirmationTextField.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        emailConfirmationTextField.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.5).active = true
        
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.topAnchor.constraintEqualToAnchor(emailConfirmationTextField.topAnchor, constant: 50).active = true
        phoneTextField.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        phoneTextField.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.5).active = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraintEqualToAnchor(phoneTextField.topAnchor, constant: 50).active = true
        passwordTextField.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        passwordTextField.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.5).active = true
        
        passwordConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmTextField.topAnchor.constraintEqualToAnchor(passwordTextField.topAnchor, constant: 50).active = true
        passwordConfirmTextField.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        passwordConfirmTextField.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.5).active = true
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        //submitButton.topAnchor.constraintEqualToAnchor(passwordConfirmTextField.topAnchor, constant: 150).active = true
        submitButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        submitButton.widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 0.25).active = true
        buttonConstraint = submitButton.topAnchor.constraintEqualToAnchor(passwordConfirmTextField.topAnchor, constant: 160)
        buttonConstraint.active = true
        
        
        self.emailTextField.delegate = self
        self.emailConfirmationTextField.delegate = self
        self.phoneTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordConfirmTextField.delegate = self
        
        
//        emailTextField.addTarget(self, action: textFieldDidEndEditing(self), forControlEvents: editing)
//        
//        
//        emailTextField.addTarget(self, action:"yourWeightEditingDidEnd:", forControlEvents:.EditingDidEnd);
        func textFieldDidBeginEditing(textField: UITextField) {
            textFieldDidEndEditing(emailTextField)
            textFieldDidEndEditing(emailConfirmationTextField)
            textFieldDidEndEditing(phoneTextField)
            textFieldDidEndEditing(passwordConfirmTextField)
            textFieldDidEndEditing(passwordTextField)
        }

        
    }
    
    

    
    func textFieldDidEndEditing(textField: UITextField) {
        let textOk = textField.text?.characters.count > 0
        let emailOk = emailTextField.text!.containsString("@") && emailTextField.text!.containsString(".")
        let emailConfirmOk = emailConfirmationTextField.text?.characters.count > 0 && emailConfirmationTextField.text == emailTextField.text
        let phoneOk = phoneTextField.text?.characters.count >= 7
        let passwordOk = passwordTextField.text?.characters.count >= 6
        let passwordConfirmOk = passwordConfirmTextField.text?.characters.count >= 6 && passwordConfirmTextField.text == passwordTextField.text
    

        
        switch textField {
        case emailTextField:
            if !textOk && !emailOk {redTextField(emailTextField)}
        case phoneTextField:
            if !phoneOk {redTextField(phoneTextField)}
        case emailConfirmationTextField:
            if !emailConfirmOk {redTextField(emailConfirmationTextField)}
        case passwordTextField:
            if !passwordOk {redTextField(passwordTextField)}
        case passwordConfirmTextField:
            if !passwordConfirmOk {redTextField(passwordConfirmTextField)}
        default:
            break
        }
        //buttonAction()
        
        if textOk && emailOk && phoneOk && emailConfirmOk && passwordOk && passwordConfirmOk {
            self.submitButton.enabled = true
           // buttonAction()
            UIView.animateWithDuration(1){
                self.buttonConstraint.constant = 60
                self.view.layoutIfNeeded()
            }
        }
    
    }

  
    
    func redTextField(textField: UITextField){
        UIView.animateWithDuration(0.1, animations: {
            UIView.setAnimationRepeatCount(2)
            textField.backgroundColor = UIColor.redColor()
            self.view.layoutIfNeeded()
            
            }, completion: {(true) in
                textField.backgroundColor = UIColor.whiteColor()

        })
        
        
        
    }
    
    func buttonAction(){
        

    }
    
}