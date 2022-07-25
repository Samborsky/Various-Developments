//
//  ViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {

//MARK: - переменные и константы

    let imageOne = UIImageView()
    let imageTwo = UIImageView()
    let imageThree = UIImageView()
    let imageFour = UIImageView()

    let categoryOne = UILabel()
    let categoryTwo = UILabel()
    let categoryThree = UILabel()
    let categoryFour = UILabel()

    let viewOne = UIView()
    let viewTwo = UIView()
    let viewThree = UIView()
    let viewFour = UIView()

    let buttonForViewOne = UIButton()
    let buttonForViewTwo = UIButton()
    let buttonForViewThree = UIButton()
    let buttonForViewFour = UIButton()

//массив с товарами
    var goodsArray = [Goods]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        createViews()
        addLine(myView: viewOne)
        addLine(myView: viewTwo)
        addLine(myView: viewThree)
        addLine(myView: viewFour)

        createButtons()
        createImages()
        createCategoriesLabels()

        fillGoods()
    }
//создаем и настраиваем view
    func createViews(){
        viewOne.frame = CGRect(x: 0, y: 44, width: self.view.frame.width, height: 100)
        viewOne.backgroundColor = .systemBackground
        self.view.addSubview(viewOne)

        viewTwo.frame = CGRect(x: 0, y: 147, width: self.view.frame.width, height: 100)
        viewTwo.backgroundColor = .systemBackground
        self.view.addSubview(viewTwo)

        viewThree.frame = CGRect(x: 0, y: 250, width: self.view.frame.width, height: 100)
        viewThree.backgroundColor = .systemBackground
        self.view.addSubview(viewThree)

        viewFour.frame = CGRect(x: 0, y: 353, width: self.view.frame.width, height: 100)
        viewFour.backgroundColor = .systemBackground
        self.view.addSubview(viewFour)
    }
//рисуем линию под "ячейкой"
    func addLine(myView: UIView) {
        let line = CALayer()
        line.frame = CGRect(x: 0, y: myView.frame.height, width: myView.frame.width, height: 3)
        line.backgroundColor = UIColor.darkGray.cgColor
        myView.layer.addSublayer(line)
    }

//создаем кнопку и растягиваем на все вью
    func createButtons(){
        buttonForViewOne.frame = CGRect(x: 0, y: 44, width: viewOne.frame.width, height: viewOne.frame.height)
        buttonForViewOne.backgroundColor = .clear
//        buttonForViewOne.addTarget(self, action: #selector(testButton(button:)), for: .touchUpInside)
        self.view.addSubview(buttonForViewOne)
        buttonForViewOne.addTarget(self, action: #selector(goToNextView(target:)), for: .touchUpInside)

        buttonForViewTwo.frame = CGRect(x: 0, y: 147, width: viewOne.frame.width, height: viewOne.frame.height)
        buttonForViewTwo.backgroundColor = .clear
        self.view.addSubview(buttonForViewTwo)

        buttonForViewThree.frame = CGRect(x: 0, y: 250, width: viewOne.frame.width, height: viewOne.frame.height)
        buttonForViewThree.backgroundColor = .clear
        self.view.addSubview(buttonForViewThree)

        buttonForViewFour.frame = CGRect(x: 0, y: 353, width: viewOne.frame.width, height: viewOne.frame.height)
        buttonForViewFour.backgroundColor = .clear
        self.view.addSubview(buttonForViewFour)
    }

    @objc func goToNextView(target: UIButton){
        print("button 1")
let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "GoodsViewController") as? GoodsViewController else {return}
//        secondViewController.imagesArray.append(goodsArray[0].image)
//        secondViewController.imagesArray.append(goodsArray[1].image)
//        secondViewController.imagesArray.append(goodsArray[2].image)
        secondViewController.categoryID = 0
        secondViewController.categoryLabel.text = "Snacks"
        secondViewController.categoryLabel.textAlignment = .center
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.descriptionLabel.textAlignment = .left
//        secondViewController.descriptionLabel.numberOfLines = 10


        secondViewController.descriptionLabel.text = "Calories 160 Fat   10g  13%"

//        Fat   10g  13%
//        Saturated   1.5g  7%
//        Trans   0g
//        Cholesterol   0mg  0%
//        Sodium   170mg  7%
//        Carbohydrates   15g  6%
//        Fiber   1g  5%
//        Sugars   less than 1g
//        Protein   2g
//        Vitamin D   0mc  0%
//        Vitamin C    6%
//        Calcium   10mg  0%
//        Iron   0.6mg  2%
//        Potassium   350mg  6%
        show(secondViewController, sender: nil)


    }

//создаем и настраиваем картинки
    func createImages(){
        imageOne.frame = CGRect(x: 0, y: 44, width: 100, height: 100)
        imageOne.image = UIImage(named: "lays salt")
        self.view.addSubview(imageOne)

        imageTwo.frame = CGRect(x: 0, y: 147, width: 100, height: 100)
        imageTwo.image = UIImage(named: "cola classic")
        self.view.addSubview(imageTwo)

        imageThree.frame = CGRect(x: 0, y: 250, width: 100, height: 100)
        imageThree.image = UIImage(named: "pork")
        self.view.addSubview(imageThree)

        imageFour.frame = CGRect(x: 0, y: 353, width: 100, height: 100)
        imageFour.image = UIImage(named: "twix")
        self.view.addSubview(imageFour)
    }

//создаем и настраиваем лейблы
    func createCategoriesLabels(){
        categoryOne.frame = CGRect(x: 110, y: 65, width: 300, height: 50)
        categoryOne.text = "Snacks"
        self.view.addSubview(categoryOne)

        categoryTwo.frame = CGRect(x: 110, y: 170, width: 300, height: 50)
        categoryTwo.text = "Drinks"
        self.view.addSubview(categoryTwo)

        categoryThree.frame = CGRect(x: 110, y: 270, width: 300, height: 50)
        categoryThree.text = "Meat and fish"
        self.view.addSubview(categoryThree)

        categoryFour.frame = CGRect(x: 110, y: 377, width: 300, height: 50)
        categoryFour.text = "Candys"
        self.view.addSubview(categoryFour)

    }

    @objc func testButton(button: UIButton) {
        performSegue(withIdentifier: "fromListToGoodsViewController", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? GoodsViewController else {return}
        switch destinationVC.categoryID {
        case 0:
            destinationVC.imagesArray.append(goodsArray[0].image)
            destinationVC.imagesArray.append(goodsArray[1].image)
            destinationVC.imagesArray.append(goodsArray[2].image)
            destinationVC.categoryID = 0

        case 1:
            destinationVC.imagesArray.append(goodsArray[3].image)
            destinationVC.imagesArray.append(goodsArray[4].image)
            destinationVC.categoryID = 1
        default: break
        }
    }
    
//наполняем массив товаров
    func fillGoods() {
        goodsArray.append(productColaOne)
        goodsArray.append(productColaTwo)

        goodsArray.append(productLaysOne)
        goodsArray.append(productLaysTwo)
        goodsArray.append(priductLaysThree)


        goodsArray.append(productMeatOne)
        goodsArray.append(productMeatFish)
        goodsArray.append(productMeatChiken)

        goodsArray.append(productCandyMars)
        goodsArray.append(productCandyTwix)
        goodsArray.append(productCandySnickers)
        goodsArray.append(productCandyBounty)
    }


}

