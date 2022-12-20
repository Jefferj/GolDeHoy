//
//  RegisterViewController.swift
//  GolDeHoy
//
//  Created by Jefferson Naranjo rodríguez on 15/12/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textfielName: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var texfieldPassword: UITextField!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var buttonRegister: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetForm() {
        buttonRegister.isEnabled = false
        textfielName.isEnabled = false
        textfieldEmail.isEnabled = false
        texfieldPassword.isEnabled = false
        labelName.text = "Required"
        labelEmail.text = "Required"
        labelPassword.text = "Required"
        textfielName.text = ""
        textfieldEmail.text = ""
        texfieldPassword.text = ""
    }
    
    func checkForValidForm() {
        if labelName.isHidden && labelEmail.isHidden && labelPassword.isHidden {
            buttonRegister.backgroundColor = .green
        }else{
            buttonRegister.backgroundColor = .red
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
    
    @IBAction func textfieldName(_ sender: Any) {
        if let name = textfielName.text{
            if let errorMessage = invalidPassword(name){
                labelName.text = errorMessage
                labelName.isHidden = false
            }else{
                labelName.isHidden = true
            }
        }
        checkForValidForm()
    }
    @IBAction func textfieldEmail(_ sender: Any) {
        if let email = textfieldEmail.text{
            if let errorMessage = invalidEmail(email){
                labelEmail.text = errorMessage
                labelEmail.isHidden = false
            }else{
                labelEmail.isHidden = true
            }
        }
        checkForValidForm()
    }
    @IBAction func textfieldPassword(_ sender: Any) {
        if let password = texfieldPassword.text{
            if let errorMessage = invalidPassword(password){
                labelPassword.text = errorMessage
                labelPassword.isHidden = false
            }else{
                labelPassword.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    @IBAction func buttonRegister(_ sender: Any) {
        if textfieldEmail.text!.contains("@") && textfieldEmail.text!.contains(".com"){
            presentTabBar()
        }else{
            verifyEmail()
        }
    }
    
    func verifyEmail(){
        let alert = UIAlertController(title: "Wrong email", message: "Please enter your correct email, for example: jefferj08@gmail.com", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func presentTabBar(){
        let tabBarViewController = TabBarViewController(nibName: "TabBarViewController", bundle: nil)
        tabBarViewController.modalPresentationStyle = .overFullScreen
        self.present(tabBarViewController, animated: true)
        resetForm()
    }
}
