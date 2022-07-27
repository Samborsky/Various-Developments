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
    
//MARK: - жизненные циклы

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
        self.title = "Categories"

    }

    //MARK: - методы

    //метод передающий данные на GoodsViewController
        func dataForNextVC(controller: GoodsViewController,imagesForArray: [UIImage], categoryLabel: String, itemsForSegment: [String], image: UIImage, priceLabel: String) {

            controller.imagesArray = imagesForArray
            controller.categoryLabel.text = categoryLabel
            controller.categoryLabel.textAlignment = .center
            controller.modalPresentationStyle = .fullScreen

            controller.itemsForSegmentControll = itemsForSegment
            controller.image.image = image
            controller.priceLabel.text = priceLabel

        }

    //создаем и настраиваем картинки
        func createImages(){
            imageOne.frame = CGRect(x: 0, y: 88, width: 100, height: 100)
            imageOne.image = UIImage(named: "lays salt")
            self.view.addSubview(imageOne)

            imageTwo.frame = CGRect(x: 0, y: 191, width: 100, height: 100)
            imageTwo.image = UIImage(named: "cola classic")
            self.view.addSubview(imageTwo)

            imageThree.frame = CGRect(x: 0, y: 294, width: 100, height: 100)
            imageThree.image = UIImage(named: "pork")
            self.view.addSubview(imageThree)

            imageFour.frame = CGRect(x: 0, y: 397, width: 100, height: 100)
            imageFour.image = UIImage(named: "twix")
            self.view.addSubview(imageFour)
        }

    //создаем и настраиваем лейблы
        func createCategoriesLabels(){
            categoryOne.frame = CGRect(x: 110, y: 110, width: 300, height: 50)
            categoryOne.text = "Snacks"
            self.view.addSubview(categoryOne)

            categoryTwo.frame = CGRect(x: 110, y: 215, width: 300, height: 50)
            categoryTwo.text = "Drinks"
            self.view.addSubview(categoryTwo)

            categoryThree.frame = CGRect(x: 110, y: 320, width: 300, height: 50)
            categoryThree.text = "Meat and fish"
            self.view.addSubview(categoryThree)

            categoryFour.frame = CGRect(x: 110, y: 425, width: 300, height: 50)
            categoryFour.text = "Candys"
            self.view.addSubview(categoryFour)
        }

    //наполняем массив товаров
        func fillGoods() {
            goodsArray.append(productLaysOne)
            goodsArray.append(productLaysTwo)
            goodsArray.append(priductLaysThree)

            goodsArray.append(productColaOne)
            goodsArray.append(productColaTwo)

            goodsArray.append(productMeatOne)
            goodsArray.append(productMeatFish)
            goodsArray.append(productMeatChiken)

            goodsArray.append(productCandyMars)
            goodsArray.append(productCandyTwix)
            goodsArray.append(productCandySnickers)
            goodsArray.append(productCandyBounty)
        }

//создаем и настраиваем view
    func createViews(){
        viewOne.frame = CGRect(x: 0, y: 88, width: self.view.frame.width, height: 100)
        viewOne.backgroundColor = .systemBackground
        self.view.addSubview(viewOne)

        viewTwo.frame = CGRect(x: 0, y: 191, width: self.view.frame.width, height: 100)
        viewTwo.backgroundColor = .systemBackground
        self.view.addSubview(viewTwo)

        viewThree.frame = CGRect(x: 0, y: 294, width: self.view.frame.width, height: 100)
        viewThree.backgroundColor = .systemBackground
        self.view.addSubview(viewThree)

        viewFour.frame = CGRect(x: 0, y: 397, width: self.view.frame.width, height: 100)
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
        buttonForViewOne.frame = CGRect(x: 0, y: 88, width: viewOne.frame.width, height: viewOne.frame.height)
        buttonForViewOne.backgroundColor = .clear
        self.view.addSubview(buttonForViewOne)
        buttonForViewOne.addTarget(self, action: #selector(goToNextView(target:)), for: .touchUpInside)

        buttonForViewTwo.frame = CGRect(x: 0, y: 191, width: viewOne.frame.width, height: viewOne.frame.height)
        buttonForViewTwo.backgroundColor = .clear
        self.view.addSubview(buttonForViewTwo)
        buttonForViewTwo.addTarget(self, action: #selector(goToNextView2(target:)), for: .touchUpInside)


        buttonForViewThree.frame = CGRect(x: 0, y: 294, width: viewOne.frame.width, height: viewOne.frame.height)
        buttonForViewThree.backgroundColor = .clear
        self.view.addSubview(buttonForViewThree)
        buttonForViewThree.addTarget(self, action: #selector(goToNextView3(target:)), for: .touchUpInside)


        buttonForViewFour.frame = CGRect(x: 0, y: 397, width: viewOne.frame.width, height: viewOne.frame.height)
        buttonForViewFour.backgroundColor = .clear
        self.view.addSubview(buttonForViewFour)
        buttonForViewFour.addTarget(self, action: #selector(goToNextView4(target:)), for: .touchUpInside)

    }
    //MARK: - селектор методы для кнопок

//кнопка 1
    @objc func goToNextView(target: UIButton){
        print("button 1")
let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "GoodsViewController") as? GoodsViewController else {return}

        dataForNextVC(controller: secondViewController,
                      imagesForArray: [goodsArray[0].image, goodsArray[1].image, goodsArray[2].image], categoryLabel: "Snacks",
                      itemsForSegment: [goodsArray[0].productName, goodsArray[1].productName, goodsArray[2].productName],
                      image: goodsArray[0].image,
                      priceLabel: "\(goodsArray[0].price)$")
        secondViewController.categoryID = 0

        show(secondViewController, sender: nil)
    }

//кнопка 2
    @objc func goToNextView2(target: UIButton){
        print("button 2")
let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "GoodsViewController") as? GoodsViewController else {return}

        dataForNextVC(controller: secondViewController,
                      imagesForArray: [goodsArray[3].image, goodsArray[4].image],
                                       categoryLabel: "Drinks",
                      itemsForSegment: [goodsArray[3].productName, goodsArray[4].productName],
                      image: goodsArray[3].image,
                      priceLabel: "\(goodsArray[3].price)$")
                secondViewController.categoryID = 1

        show(secondViewController, sender: nil)
    }
//кнопка 3
    @objc func goToNextView3(target: UIButton){
        print("button 3")
let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "GoodsViewController") as? GoodsViewController else {return}

        dataForNextVC(controller: secondViewController,
                      imagesForArray: [goodsArray[5].image, goodsArray[6].image, goodsArray[7].image],
                                       categoryLabel: "Meat and fish",
                      itemsForSegment: [goodsArray[5].productName, goodsArray[6].productName, goodsArray[7].productName],
                      image: goodsArray[5].image,
                      priceLabel: "\(goodsArray[5].price)$")
                secondViewController.categoryID = 2

        show(secondViewController, sender: nil)
    }

    //кнопка 4
        @objc func goToNextView4(target: UIButton){
            print("button 4")
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "GoodsViewController") as? GoodsViewController else {return}

            dataForNextVC(controller: secondViewController,
                          imagesForArray: [goodsArray[8].image, goodsArray[9].image, goodsArray[10].image, goodsArray[11].image],
                                           categoryLabel: "Candys",
                          itemsForSegment: [goodsArray[8].productName, goodsArray[9].productName, goodsArray[10].productName, goodsArray[11].productName],
                          image: goodsArray[8].image,
                          priceLabel: "\(goodsArray[8].price)$")
                    secondViewController.categoryID = 3

            show(secondViewController, sender: nil)
        }
}

