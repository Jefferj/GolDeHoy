//
//  LoginViewController.swift
//  GolDeHoy
//
//  Created by Jefferson Naranjo rodríguez on 14/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textfieldPassword: UITextField!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var buttonLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func resetForm() {
        buttonLogin.isEnabled = false
        labelName.isEnabled = false
        labelPassword.isEnabled = false
        labelName.text = "Required"
        labelPassword.text = "Required"
        textfieldName.text = ""
        textfieldPassword.text = ""
        
    }
    
    func checkForValidForm() {
        if labelName.isHidden && labelPassword.isHidden {
            buttonLogin.isEnabled = true
        }else{
            buttonLogin.isEnabled = false
        }
    }
    
    func invalidEmail(_ value: String) -> String? {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value){
            return "Invalid email address"
        }
        return nil
    }
    
    func invalidPassword(_ value: String) -> String?{
        if value.count < 8 {
            return "Password must be at least 8 characters"
        }else if containsDigit(value){
            return "Password must contain at leats 1 digit"
        }else if containsLowerCase(value){
            return "Password must contain at leats 1 lowercase character"
        }else if containsUpperCase(value){
            return "Password must contain at leats 2 uppercase character"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool {
            let reqularExpression = ".*[0-9]+.*"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            return !predicate.evaluate(with: value)
        }
    
    func containsLowerCase(_ value: String) -> Bool {
            let reqularExpression = ".*[a-z]+.*"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            return !predicate.evaluate(with: value)
        }
        
        func containsUpperCase(_ value: String) -> Bool {
            let reqularExpression = ".*[A-Z]+.*"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            return !predicate.evaluate(with: value)
        }
    
    @IBAction func emailAction(_ sender: Any) {
            if let email = textfieldName.text{
                if let errorMessage = invalidEmail(email){
                    labelName.text = errorMessage
                    labelName.isHidden = false
                    
                }else{
                    labelName.isHidden = true
                }
            }
            checkForValidForm()
    }
    
    @IBAction func passwordAction(_ sender: Any) {
        if let password = textfieldPassword.text{
            if let errorMessage = invalidPassword(password){
                labelPassword.text = errorMessage
                labelPassword.isHidden = false
            }else{
                labelPassword.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        if textfieldName.text!.contains("@") && textfieldName.text!.contains(".com"){
            presentHome()
        }else {
            verifyEmail()
        }
        resetForm()
    }
    
    @IBAction func buttonRegister(_ sender: Any) {
        presentRegister()
    }
    
    func verifyEmail(){
        let alert = UIAlertController(title: "Wrong email", message: "Please enter your correct email, for example: jefferj08@gmail.com", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func presentHome(){
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeViewController.modalPresentationStyle = .overFullScreen
        self.present(homeViewController, animated: true)
    }
    
    func presentRegister(){
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}
