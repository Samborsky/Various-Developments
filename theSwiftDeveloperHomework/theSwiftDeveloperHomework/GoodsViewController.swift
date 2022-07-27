//
//  GoodsViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 24.07.2022.
//

import UIKit

class GoodsViewController: UIViewController {

    //MARK: - переменные и константы

    let categoryLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()

    let image = UIImageView()

    var segmentedControll = UISegmentedControl()

    let goodsToNeed = UITextField()

    let coutPicker = UIPickerView()

    let buyButton = UIButton()
    let cartButton = UIButton()

    var imagesArray = [UIImage]()

    var categoryID = 0
    var itemsForSegmentControll = [String]()
    let toolBar = UIToolbar()
    let productsCountForPicker = Array(1...10)

    //MARK: - методы жизненного цикла

    override func viewDidLoad() {
        super.viewDidLoad()

        createImage()
        createLabels()
        createButtons()
        createSegmentedControll()
        createGoodsCountTextField()

//сегмент который выбран по умолчанию
        segmentedControll.selectedSegmentIndex = 0

        descriptionLabel.numberOfLines = 10
        descriptionLabel.text =
"""
Calories 160
Fat 10g  13%
Saturated   1.5g  7%
Sugars   less than 1g
Vitamin C    6%
"""

        coutPicker.delegate = self
        coutPicker.dataSource = self

        picker(textField: goodsToNeed)

    }

    //MARK: - создаем кнопку Done

    func picker(textField: UITextField) {

//теперь при нажатии на текстфилд будет всплывать не клавиатура, а пикер

        goodsToNeed.inputView = coutPicker


        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonSelector))

        //настраиваем UIToolBar
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        toolBar.tintColor = .systemBlue
        toolBar.setItems([doneButton], animated: true)
        //добавляем дополнительный элемент над вызванным элементом(клавиатура, вью)
        textField.inputAccessoryView = toolBar
    }

    //делаем кнопку Done рабочей(Уведомляет этот объект о том, что его попросили отказаться от статуса первого ответившего в его окне.)
    @objc func doneButtonSelector(){

//с этой проверкой кнопка Done без прокрутки будет срабатывать на первй элемент
        if (goodsToNeed.text?.isEmpty)! {
            goodsToNeed.text = String(productsCountForPicker.first!)
        }
//--------этот код работает аналогично верхней проверке-------
//        let selectedIndex = coutPicker.selectedRow(inComponent: 0)
//        goodsToNeed.text = String(productsCountForPicker[selectedIndex])

        goodsToNeed.resignFirstResponder()
    }
    
//MARK: - методы

//создам лейблы
    func createLabels(){
        categoryLabel.frame = CGRect(x: 115, y: 90, width: 200, height: 30)
        categoryLabel.backgroundColor = .systemBackground
        self.view.addSubview(categoryLabel)

        descriptionLabel.frame = CGRect(x: 0, y: 130, width: 400, height: 120)
        descriptionLabel.backgroundColor = .systemBackground
        descriptionLabel.textAlignment = .center
        self.view.addSubview(descriptionLabel)

        priceLabel.frame = CGRect(x: 69, y: 608, width: 60, height: 30)
        priceLabel.backgroundColor = .systemBackground
        self.view.addSubview(priceLabel)
    }

//создаем лейблы
    func createImage(){
        image.frame = CGRect(x: 69, y: 266, width: 276, height: 276)
        image.backgroundColor = .systemBackground
        self.view.addSubview(image)
    }

//создаем SegmentedControll
    func createSegmentedControll(){
        segmentedControll = UISegmentedControl(items: itemsForSegmentControll)
        segmentedControll.frame = CGRect(x: 69, y: 560, width: 276, height: 31)
        segmentedControll.backgroundColor = .systemBackground
        self.view.addSubview(segmentedControll)

        segmentedControll.addTarget(self, action: #selector(segmentedControllSelector(target:)), for: .valueChanged)
    }

//меняем картинку при переключении segmentedControll
    @objc func segmentedControllSelector(target: UISegmentedControl) {
        if target == segmentedControll {
            let segmentIndex = target.selectedSegmentIndex
            image.image = imagesArray[segmentIndex]
        }
        if categoryID == 0 {
            switch target.selectedSegmentIndex {
            case 0:
                priceLabel.text = "\(productLaysOne.price)$"
            case 1:
                priceLabel.text = "\(productLaysTwo.price)$"
            case 2:
                priceLabel.text = "\(priductLaysThree.price)$"
            default: break
            }

        } else if categoryID == 1 {
            switch target.selectedSegmentIndex {
            case 0:
                priceLabel.text = "\(productColaOne.price)$"
            case 1:
                priceLabel.text = "\(productColaTwo.price)$"
            default: break
            }

        } else if categoryID == 2 {
            switch target.selectedSegmentIndex {
            case 0:
                priceLabel.text = "\(productMeatOne.price)$"
            case 1:
                priceLabel.text = "\(productMeatFish.price)$"
            case 2:
                priceLabel.text = "\(productMeatChiken.price)$"
            default: break
            }

        } else if categoryID == 3 {
            switch target.selectedSegmentIndex {
            case 0:
                priceLabel.text = "\(productCandySnickers.price)$"
            case 1:
                priceLabel.text = "\(productCandyMars.price)$"
            case 2:
                priceLabel.text = "\(productCandyBounty.price)$"
            case 3:
                priceLabel.text = "\(productCandyTwix.price)$"
            default: break
            }

        }
    }

//создаем текстфилд и пикер
    func createGoodsCountTextField(){
        goodsToNeed.frame = CGRect(x: 135, y: 608, width: 110, height: 30)
        goodsToNeed.backgroundColor = .systemBackground
        goodsToNeed.textAlignment = .center
        goodsToNeed.placeholder = "choose count"
        self.view.addSubview(goodsToNeed)


    }

//создаем кнопки
    func createButtons(){
        buyButton.frame = CGRect(x: 260, y: 608, width: 76, height: 30)
        buyButton.backgroundColor = .systemBlue
        buyButton.setTitle("Buy", for: .normal)
        self.view.addSubview(buyButton)
        buyButton.addTarget(self, action: #selector(buyGoods(target:)), for: .touchUpInside)

        cartButton.frame = CGRect(x: 260, y: 800, width: 76, height: 30)
        cartButton.backgroundColor = #colorLiteral(red: 1, green: 0.4335649477, blue: 0.2979323711, alpha: 1)
        cartButton.setTitle("Cart", for: .normal)
        self.view.addSubview(cartButton)
        cartButton.addTarget(self, action: #selector(cartButtonSelector(action:)), for: .touchUpInside)
    }

//метод для "добавления" товаров в корзину
    @objc func cartButtonSelector(action: UIButton){
print("cart")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        guard let cartVC = storyboard.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else {return}

//        cartVC.modalPresentationStyle = .fullScreen
performSegue(withIdentifier: "testSegue", sender: nil)
//        show(cartVC, sender: nil)

    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "testSegue" else {return}
        guard let destVC = segue.destination as? CartViewController else {return}
        let segmentedIndex = segmentedControll.selectedSegmentIndex
        if segmentedControll.selectedSegmentIndex == 0 {
            destVC.text1 = itemsForSegmentControll[0]
        } else if segmentedControll.selectedSegmentIndex == 1 {
            destVC.text2 = itemsForSegmentControll[1]
        } else if segmentedControll.selectedSegmentIndex == 2 {
            destVC.text3 = itemsForSegmentControll[2]
        }



    }

    //MARK: - передача информации на CartViewController

    //метод для передачи информации на CartViewController
        @objc func buyGoods(target: UIButton) {
print("buy")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            guard let cartVC = storyboard.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else {return}

            let segmentedIndex = segmentedControll.selectedSegmentIndex
            
//            cartVC.imageOne.image = imagesArray[segmentedIndex]
//            cartVC.imageTwo.image = imagesArray[segmentedIndex]
//            cartVC.imageThree.image = imagesArray[segmentedIndex]
//
//            cartVC.labelOne.text = itemsForSegmentControll[segmentedIndex]
//            cartVC.labelTwo.text = itemsForSegmentControll[segmentedIndex]
//            cartVC.labelThree.text = itemsForSegmentControll[segmentedIndex]
//
//

        }

}


//MARK: - расширения

extension GoodsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(productsCountForPicker[row])"
    }
}

extension GoodsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return productsCountForPicker.count
    }
    //какую строку выбрал пользователь,
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        goodsToNeed.text = String(productsCountForPicker[row])
    }



}
