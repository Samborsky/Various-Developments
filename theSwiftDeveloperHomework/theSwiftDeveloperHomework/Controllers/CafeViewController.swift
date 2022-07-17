//
//  CafeViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 06.07.2022.
//

import UIKit

class CafeViewController: UIViewController {

    //MARK: - аутлеты

    @IBOutlet weak var nameTextLabel: UITextField!
    
    @IBOutlet weak var guestCountTextField: UITextField!
    
    @IBOutlet weak var tableTextField: UITextField!
    
    @IBOutlet weak var reservSwitch: UISwitch!

    @IBOutlet weak var paySwitch: UISwitch!

    @IBOutlet weak var vipSwitch: UISwitch!

    //MARK: - константы/переменные

    let randomArrayInt = Array(1...3)
    var checkSeats = false

    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - экшены

    @IBAction func billButton(_ sender: Any) {
        //алерт контроллер
        let alertVC = UIAlertController(title: "Закрытие чека", message: "выставить счет?", preferredStyle: .alert)
        let alertButtonOne = UIAlertAction(title: "Ок", style: .default) { _ in
            if self.checkSeats == false {

                //алерт если бронь без проверки места
                let newAlertVC = UIAlertController(title: "Упс!", message: "вам нужно проверить количество свободных мест", preferredStyle: .alert)
                let newAlert = UIAlertAction(title: "Ок", style: .cancel)
                newAlertVC.addAction(newAlert)
                self.present(newAlertVC, animated: true, completion: nil)

            } else {
let thirdView = UIStoryboard(name: "Main", bundle: nil)
                guard let nextScreen = thirdView.instantiateViewController(withIdentifier: "BillViewController") as? BillViewController else {return}
                nextScreen.fioLabelNew = self.nameTextLabel.text ?? ""
                nextScreen.guestLabelNew = self.guestCountTextField.text ?? ""
                nextScreen.tableLabelNew = self.tableTextField.text ?? ""
                self.show(nextScreen, sender: nil)
//                self.performSegue(withIdentifier: "toBillSegue", sender: nil)
            }
        }
        //алерт отмены
        let alertButtonTwo = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertVC.addAction(alertButtonOne)
        alertVC.addAction(alertButtonTwo)
        present(alertVC, animated: true, completion: nil)

    }

    //проверка наличия свободных мест
    @IBAction func checkSeats(_ sender: UIButton) {
        if let guestCount = Int(guestCountTextField.text ?? ""){
            if guestCount >= 4 {
                //алерт контроллер
                let alertVC = UIAlertController(title: "Упс!", message: "нам жаль, всего осталось \(randomArrayInt.randomElement() ?? 0) мест", preferredStyle: .alert)
                let alerctAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertVC.addAction(alerctAction)
                present(alertVC, animated: true, completion: nil)

            } else {

                let alertVC = UIAlertController(title: "Все хорошо", message: "Нашли для вас место", preferredStyle: .alert)
                let alerctAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertVC.addAction(alerctAction)
                present(alertVC, animated: true, completion: nil)
                checkSeats = true
            }
        }

    }

}
