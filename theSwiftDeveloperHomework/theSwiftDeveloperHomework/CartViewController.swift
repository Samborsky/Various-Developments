//
//  CartViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 25.07.2022.
//

import UIKit

class CartViewController: UIViewController{


//MARK: - UIImageView
var text1 = ""
    var text2 = ""
    var text3 = ""


    let imageOne = UIImageView()
    let imageTwo = UIImageView()
    let imageThree = UIImageView()
    let imageFour = UIImageView()
    let imageFive = UIImageView()
    let imageSix = UIImageView()
    let imageSeven = UIImageView()

//MARK: - UILabel

    let labelOne = UILabel()
    let labelTwo = UILabel()
    let labelThree = UILabel()
    let labelFour = UILabel()
    let labelFive = UILabel()
    let labelSix = UILabel()
    let labelSeven = UILabel()
    let totalMoney = UILabel()
    let emptyCart = UILabel()

    let backToPurchases = UIButton()
    let orderButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
createImages()
createLabels()
createButton()
        labelOne.text = text1
        labelTwo.text = text2
        labelThree.text = text3

    }

    //создаем и настраиваем картинки
        func createImages(){
            imageOne.frame = CGRect(x: 0, y: 88, width: 100, height: 100)
//            imageOne.image = UIImage(named: "lays salt")
            self.view.addSubview(imageOne)

            imageTwo.frame = CGRect(x: 0, y: 191, width: 100, height: 100)
//            imageTwo.image = UIImage(named: "cola classic")
            self.view.addSubview(imageTwo)

            imageThree.frame = CGRect(x: 0, y: 294, width: 100, height: 100)
//            imageThree.image = UIImage(named: "pork")
            self.view.addSubview(imageThree)

            imageFour.frame = CGRect(x: 0, y: 397, width: 100, height: 100)
//            imageFour.image = UIImage(named: "twix")
            self.view.addSubview(imageFour)

            imageFive.frame = CGRect(x: 0, y: 500, width: 100, height: 100)
//            imageFive.image = UIImage(named: "twix")
            self.view.addSubview(imageFive)

            imageSix.frame = CGRect(x: 0, y: 603, width: 100, height: 100)
//            imageSix.image = UIImage(named: "twix")
            self.view.addSubview(imageSix)

            imageSeven.frame = CGRect(x: 0, y: 706, width: 100, height: 100)
//            imageSeven.image = UIImage(named: "twix")
            self.view.addSubview(imageSeven)
        }

    func createLabels(){
        labelOne.frame = CGRect(x: 110, y: 110, width: 200, height: 50)
        self.view.addSubview(labelOne)

        labelTwo.frame = CGRect(x: 110, y: 215, width: 200, height: 50)
        self.view.addSubview(labelTwo)

        labelThree.frame = CGRect(x: 110, y: 320, width: 200, height: 50)
        self.view.addSubview(labelThree)

        labelFour.frame = CGRect(x: 110, y: 425, width: 200, height: 50)
        self.view.addSubview(labelFour)

        labelFive.frame = CGRect(x: 110, y: 525, width: 200, height: 50)
        self.view.addSubview(labelFive)

        labelSix.frame = CGRect(x: 110, y: 625, width: 200, height: 50)
        self.view.addSubview(labelSix)

        labelSeven.frame = CGRect(x: 110, y: 730, width: 200, height: 50)
        self.view.addSubview(labelSeven)

        totalMoney.frame = CGRect(x: 200, y: 800, width: 80, height: 30)
        totalMoney.text = "800$"
        self.view.addSubview(totalMoney)

        emptyCart.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        emptyCart.center = self.view.center
        emptyCart.text = "Your cart is empty"
        emptyCart.textAlignment = .center
        emptyCart.isHidden = true
        self.view.addSubview(emptyCart)
    }

    func createButton() {
        orderButton.frame = CGRect(x: 290, y: 800, width: 100, height: 30)
        orderButton.backgroundColor = .systemBlue
        orderButton.setTitle("Order", for: .normal)
        orderButton.titleLabel?.textAlignment = .center
        self.view.addSubview(orderButton)
        orderButton.addTarget(self, action: #selector(orderButtonSelector(action:)), for: .touchUpInside)

        backToPurchases.frame = CGRect(x: self.view.center.x - 100, y: self.view.center.y + 20, width: 200, height: 30)
        backToPurchases.backgroundColor = .systemBlue
        backToPurchases.titleLabel?.textAlignment = .center
        backToPurchases.setTitle("Back to purchases", for: .normal)
        backToPurchases.isHidden = true
        self.view.addSubview(backToPurchases)
        backToPurchases.addTarget(self, action: #selector(backToCategories(action:)), for: .touchUpInside)
    }

    //метод кнопки возвращения на стартовый вью
    @objc func backToCategories(action: UIButton){
        guard action == backToPurchases else {return}
        self.navigationController?.popToRootViewController(animated: true)
    }

//метод кнопки оформления заказа, алерт + обнуление экрана после покупки
    @objc func orderButtonSelector(action: UIButton){
        guard action == orderButton else {return}

        let alertController = UIAlertController(title: "Congratulations", message: "Your order successfully sent, soon our manager will call you", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.imageOne.image = nil
            self.imageTwo.image = nil
            self.imageThree.image = nil
            self.imageFour.image = nil
            self.imageFive.image = nil
            self.imageSix.image = nil
            self.imageSeven.image = nil

            self.labelOne.text = nil
            self.labelTwo.text = nil
            self.labelThree.text = nil
            self.labelFour.text = nil
            self.labelFive.text = nil
            self.labelSix.text = nil
            self.labelSeven.text = nil
            self.totalMoney.text = nil

            self.emptyCart.isHidden = false

            self.orderButton.isHidden = true

            self.backToPurchases.isHidden = false
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }

}
