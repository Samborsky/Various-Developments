//
//  ViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 06.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - аутлеты

    @IBOutlet weak var logoImage: UIImageView!

    @IBOutlet weak var loginLabel: UILabel!

    @IBOutlet weak var logintextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!


    //MARK: - viewDidLoad

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)

    }

    //MARK: - экшены

    //посмотреть введенный пароль
    @IBAction func passwordUnsecureButton(_ sender: UIButton) {

        passwordTextField.isSecureTextEntry.toggle()
    }


    @IBAction func LogInButton(_ sender: UIButton) {
//проверка пустых полей
        if loginLabel.text != "" && passwordTextField.text != "" {
//делаем переход на следующий экран
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextView = storyboard.instantiateViewController(withIdentifier: "CafeViewController")

            nextView.modalPresentationStyle = .fullScreen
            present(nextView, animated: true, completion: nil)
        } else {
//алерты в случае пустых полей
            let alertVC = UIAlertController(title: "Ошибка!", message: "Введите логин и пароль", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
            alertVC.addAction(alertAction)
            present(alertVC, animated: true, completion: nil)
        }

    }



}

