//
//  ViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {

    let logoImage = UIImageView()

    let loginTextField = UITextField()
    let passwordTextField = UITextField()

    let faceIDSwitcher = UISwitch()

    let loginButton = UIButton()
    let securePassword = UIButton()

    let labelForSwitch = UILabel()



    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray
        textFieldsProperties()
        logoImagePropetries()
        buttounsProperties()
        switcherProperties()
        labelsProperties()

        
    }

// настраиваем текстфилды
    func textFieldsProperties() {
        loginTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        loginTextField.center = CGPoint(x: self.view.bounds.width / 2, y: 300)
        loginTextField.placeholder = "Valera1943"
        loginTextField.borderStyle = .roundedRect
        view.addSubview(loginTextField)

        passwordTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        passwordTextField.center = CGPoint(x: self.view.bounds.width / 2, y: 350)
        passwordTextField.placeholder = "**********"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
    }

//настраиваем логотип
    func logoImagePropetries() {
        logoImage.image = UIImage(systemName: "logo.xbox")
        logoImage.layer.shadowColor = UIColor.red.cgColor
        logoImage.layer.shadowOffset = CGSize(width: 1, height: 1)
        logoImage.layer.shadowRadius = 10
        logoImage.layer.shadowOpacity = 0.5
        logoImage.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        logoImage.center = CGPoint(x: self.view.bounds.width / 2, y: 150)
        self.view.addSubview(logoImage)
    }
//настраиваем кнопки
    func buttounsProperties() {
        securePassword.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        securePassword.center = CGPoint(x: self.view.bounds.width / 2 + 80, y: 350)
        securePassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        securePassword.tintColor = .lightGray
        self.view.addSubview(securePassword)
        securePassword.addTarget(self, action: #selector(securePasswordSelector(button:)), for: .touchUpInside)


        loginButton.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        loginButton.center = CGPoint(x: self.view.bounds.width / 2, y: 450)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        self.view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonSelector(loginButton:)), for: .touchUpInside)
    }
    @objc func loginButtonSelector(loginButton: UIButton) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else {return}

        if login.isEmpty && password.isEmpty && faceIDSwitcher.isOn == false {
print("error")
           
        } else if login.isEmpty && password.isEmpty || faceIDSwitcher.isOn == true {
            print("ok")

            performSegue(withIdentifier: "fromLoginViewToBirthdayView", sender: nil)

        } else if login.isEmpty == false && password.isEmpty == false {
            print("ok2")

            performSegue(withIdentifier: "fromLoginViewToBirthdayView", sender: nil)

        }
    }

    @objc func securePasswordSelector(button: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        if passwordTextField.isSecureTextEntry == true {
            securePassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            securePassword.setImage(UIImage(systemName: "eye"), for: .normal)

        }
    }

    func switcherProperties() {

        faceIDSwitcher.frame = CGRect(x: 350, y: 385, width: 0, height: 0)
        faceIDSwitcher.tintColor = .blue
        self.view.addSubview(faceIDSwitcher)

    }

    func labelsProperties() {
        labelForSwitch.frame = CGRect(x: 200, y: 385, width: 150, height: 30)
        labelForSwitch.text = "Вход по Face ID"
        self.view.addSubview(labelForSwitch)
    }

}
