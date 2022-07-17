//
//  ViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {
//MARK: - константы/переменные

    let startButton = UIButton()
    let guessButton = UIButton()
    let calculateButton = UIButton()

    let nameLabel = UILabel()
    let numberResultLabel = UILabel()
    let guesGameLabel = UILabel()

    var numberOne: Int = 0
    var numberTwo: Int = 0
    var guesGameResult = 0

    let randomNumbersArray = Array(1...2)

    //MARK: - жизненные циклы

    override func viewDidLoad() {
        super.viewDidLoad()
buttonsProperties()
labelProperties()

    }

    //MARK: -  методы

//пареметры для лейблов
    func labelProperties() {
        nameLabel.frame = CGRect(x: 40, y: 100, width: 200, height: 50)
        self.view.addSubview(nameLabel)
        nameLabel.textColor = .red

        numberResultLabel.frame = CGRect(x: 40, y: 140, width: 400, height: 50)
        numberResultLabel.textColor = .orange
        self.view.addSubview(numberResultLabel)

        guesGameLabel.frame = CGRect(x: 40, y: 180, width: 400, height: 50)
        guesGameLabel.textColor = .yellow
        self.view.addSubview(guesGameLabel)
    }

//параметры для кнопок
    func buttonsProperties() {
        startButton.frame = CGRect(x: 150, y: 440, width: 150, height: 40)
        startButton.setTitle("Старт", for: .normal)
        startButton.backgroundColor = .blue
        startButton.setTitleColor(.black, for: .normal)

        view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(startButtonSelector(button:)), for: .touchUpInside)

        guessButton.frame = CGRect(x: 150, y: 560, width: 150, height: 40)
        guessButton.setTitle("Угадай число", for: .normal)
        guessButton.backgroundColor = .yellow
        guessButton.setTitleColor(.black, for: .normal)
        view.addSubview(guessButton)
        guessButton.addTarget(self, action: #selector(guesButtonSelector(button:)), for: .touchUpInside)

        calculateButton.frame = CGRect(x: 150, y: 500, width: 150, height: 40)
        calculateButton.setTitle("Посчитать", for: .normal)
        calculateButton.backgroundColor = .green
        calculateButton.setTitleColor(.black, for: .normal)

        view.addSubview(calculateButton)
        calculateButton.addTarget(self, action: #selector(caclulateButtonSelector(button:)), for: .touchUpInside)

    }

    //работа кнопки Старт
    @objc func startButtonSelector(button: UIButton) {

        let alertVC = UIAlertController(title: nil, message: "Введите свое имя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
//забираем введенный текст
            let text = alertVC.textFields?.first?.text

//передаем введенный текст в лейбл
            self.nameLabel.text = "Имя игрока - \(text ?? "")"
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

//добавляем текстфилд
        alertVC.addTextField(configurationHandler: nil)
//добавлям алекрты(кнопки)
        alertVC.addAction(action)
        alertVC.addAction(actionCancel)

        self.present(alertVC, animated: true)

    }

    //MARK: - селектор методы

    //работа кнопки Посчитать
    @objc func caclulateButtonSelector(button: UIButton) {

        let alertVCTwo = UIAlertController(title: "Операция сложения", message: "Введите числа", preferredStyle: .alert)
        let actionTwo = UIAlertAction(title: "Посчитать", style: .default) { _ in

//достаем текст из тексфилда
            let textOne = alertVCTwo.textFields?.first?.text
            let textTwo = alertVCTwo.textFields?[1].text
//передаем значения тексфилда переменным
            self.numberOne = Int(textOne ?? "") ?? 0
            self.numberTwo = Int(textTwo ?? "") ?? 0
            //выводим результат
            self.numberResultLabel.text = "Результат вычисления = \(String(self.numberOne + self.numberTwo))"
        }
//настраиваем текстфилды
        alertVCTwo.addTextField { text in
            text.placeholder = "Введите первое число"
            text.textColor = .red
        }
//настраиваем текстфилды
        alertVCTwo.addTextField { text2 in
            text2.placeholder = "Введите второе число"
            text2.textColor = .red
        }

        alertVCTwo.addAction(actionTwo)
        self.present(alertVCTwo, animated: true)

    }

    //работа кнопки Угадай число
    @objc func guesButtonSelector(button: UIButton) {
//создаем 1 алерт
        let alertVC = UIAlertController(title: "Угадайте загаданное число", message: "Введите число от 1 до 10", preferredStyle: .alert)
        alertVC.addTextField(configurationHandler: nil)

        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        //создаем кнопку ОК и передаем замыкание при нажатии на нее
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            let number = alertVC.textFields?.first?.text
            let num = Int(number ?? "") ?? 0

            if num == self.randomNumbersArray.randomElement() {
//если угадали число плюсуем колчество побед и выводим на экран
                let alertVC2 = UIAlertController(title: "Поздравляем!", message: "Вам удалось угадать число!", preferredStyle: .alert)
                let alert1 = UIAlertAction(title: "ОК", style: .default, handler: nil)
                alertVC2.addAction(alert1)
                self.present(alertVC2, animated: true, completion: nil)
                self.guesGameResult += 1
                self.guesGameLabel.text = "Вам удалось угадать число \(self.guesGameResult) раз"

            } else {
//если не угали, выводим сообщение и вызываем алерт для повторной игры
                    let alertVC2 = UIAlertController(title: "Мимо!", message: "Вы не угадали число", preferredStyle: .alert)
                let alert2 = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
                let alert1 = UIAlertAction(title: "Попробовать еще", style: .default) { _ in
                    self.present(alertVC, animated: true, completion: nil)
                    alertVC.textFields?[0].text = nil

                }
                    alertVC2.addAction(alert1)
                alertVC2.addAction(alert2)
                self.present(alertVC2, animated: true)

            }
        }

        alertVC.addAction(actionCancel)
        alertVC.addAction(action)

        self.present(alertVC, animated: true)
    }
}

