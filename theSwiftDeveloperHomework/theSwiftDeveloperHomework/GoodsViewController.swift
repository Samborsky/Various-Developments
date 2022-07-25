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

    var imagesArray = [UIImage]()

    var categoryID = 0
    var itemsForSegmentControll = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        createImage()
        createLabels()
        createBuyButton()
        createSegmentedControll()
        createGoodsCountTextField()

    }
    
//MARK: - методы

//создам лейблы
    func createLabels(){
        categoryLabel.frame = CGRect(x: 115, y: 70, width: 200, height: 30)
        categoryLabel.backgroundColor = .red
        self.view.addSubview(categoryLabel)

        descriptionLabel.frame = CGRect(x: 0, y: 130, width: 400, height: 120)
        descriptionLabel.backgroundColor = .red
        self.view.addSubview(descriptionLabel)

        priceLabel.frame = CGRect(x: 69, y: 608, width: 100, height: 30)
        priceLabel.backgroundColor = .red
        self.view.addSubview(priceLabel)

    }

//создаем лейблы
    func createImage(){
        image.frame = CGRect(x: 69, y: 266, width: 276, height: 276)
        image.backgroundColor = .red
        self.view.addSubview(image)
    }

//создаем SegmentedControll
    func createSegmentedControll(){
        segmentedControll = UISegmentedControl(items: [itemsForSegmentControll])
        segmentedControll.frame = CGRect(x: 69, y: 560, width: 276, height: 31)
        segmentedControll.backgroundColor = .yellow
        self.view.addSubview(segmentedControll)

        segmentedControll.addTarget(self, action: #selector(segmentedControllSelector(target:)), for: .valueChanged)
    }

//меняем картинку при переключении segmentedControll
    @objc func segmentedControllSelector(target: UISegmentedControl) {
        if target == segmentedControll {
            let segmentIndex = target.selectedSegmentIndex
            image.image = imagesArray[segmentIndex]
        }
    }

    //создаем текстфилд и пикер
    func createGoodsCountTextField(){
        goodsToNeed.frame = CGRect(x: 190, y: 608, width: 60, height: 30)
        goodsToNeed.backgroundColor = .red
        self.view.addSubview(goodsToNeed)
    }

    //создаем кнопку купить
    func createBuyButton(){
        buyButton.frame = CGRect(x: 270, y: 608, width: 76, height: 30)
        buyButton.backgroundColor = .red
        self.view.addSubview(buyButton)
    }

}
