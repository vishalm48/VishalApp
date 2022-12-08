//
//  LoginClass.swift
//  VishalApp
//
//  Created by Vishal M on 01/12/22.
//

import UIKit
protocol protocolForLogin{
    func log(dataLog:String)
}


class LoginClass: UIViewController {
    
    static var isLoggedIn:Bool?
    
    let topView: UIView = {
            let view = UIView()
            view.backgroundColor = .cyan
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    var delegate:protocolForLogin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTopView()
        setupTextFields()
    
              }
    
    func setupTopView() {
            
            view.addSubview(topView)
            
            topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
    
    let emailTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Email"
            textField.borderStyle = .roundedRect
            textField.backgroundColor = UIColor(white: 0, alpha: 0.1)
            return textField
            textField.addTarget(LoginClass.self, action: #selector(handleTextChange), for: .editingChanged)
        return textField
            
        }()
        
//        let usernameTextField: UITextField = {
//            let textField = UITextField()
//            textField.translatesAutoresizingMaskIntoConstraints = false
//            textField.placeholder = "Username"
//            textField.borderStyle = .roundedRect
//            textField.backgroundColor = UIColor(white: 0, alpha: 0.1)
//            return textField
//            textField.addTarget(LoginClass.self, action: #selector(handleTextChange), for: .editingChanged)
//            return textField
//
//        }()
//
        let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
            textField.borderStyle = .roundedRect
            textField.backgroundColor = UIColor(white: 0, alpha: 0.1)
            textField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
            return textField
            
        }()
        
        let signUpButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Log In", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 3
            button.backgroundColor = UIColor.lightGray
            button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)

            return button
        }()
    
    func setupTextFields() {
            
            let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, signUpButton])
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            //add stack view as subview to main view with AutoLayout
            view.addSubview(stackView)
            stackView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 40).isActive = true
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
            stackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
        }
    
    @objc func handleSignUp() {
            validateForm()
        }
        
        func validateForm() {
            guard let emailText = emailTextField.text, !emailText.isEmpty else { return }
            guard let passwordText = passwordTextField.text, !passwordText.isEmpty else { return }
           // guard let usernameText = usernameTextField.text, !usernameText.isEmpty else { return }
            
            startSigningUp(email: emailText, password: passwordText)
        }
        
    func startSigningUp(email: String, password: String) {
        //            print("Please call any Sign up api for registration: ", email, password, username)
        //delegate.log(dataLog: "Log Out")
        
        LoginClass.isLoggedIn = true
        
    }
    
    @objc func handleTextChange() {
            
            let emailText = emailTextField.text!
          //  let usernameText = usernameTextField.text!
            let passwordText = passwordTextField.text!
            
            let isFormFilled = !emailText.isEmpty &&  !passwordText.isEmpty
            
            if isFormFilled {
                signUpButton.backgroundColor = UIColor.orange
                signUpButton.isEnabled = true
            }else {
                signUpButton.backgroundColor = UIColor.lightGray
                signUpButton.isEnabled = false
            }
            
        }
}
