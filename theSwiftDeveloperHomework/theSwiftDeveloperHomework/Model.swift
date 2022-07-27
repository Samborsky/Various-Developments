//
//  Model.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 24.07.2022.
//

import Foundation
import UIKit

//количество денег
var money = 750

protocol GoodsProtocol {
    var productName: String {get}
    var image: UIImage {get}
    var price: Double {get set}
    var goodsCount: Int {get set}
}

struct Goods: GoodsProtocol {
    var productName: String

    var image: UIImage

    var price: Double

    var goodsCount: Int
    
}


//MARK: - экземпляры массива товаров (Goods)
let productLaysOne = Goods(productName: "Lays Cheese", image: UIImage(named: "lays cheese")!, price: 80, goodsCount: 5)
let productLaysTwo = Goods(productName: "Lays Bekon", image: UIImage(named: "lays bekon")!, price: 78, goodsCount: 3)
let priductLaysThree = Goods(productName: "Lays Salt", image: UIImage(named: "lays salt")!, price: 75, goodsCount: 10)

let productColaOne = Goods(productName: "Cola Classic", image: UIImage(named: "cola classic")!, price: 20, goodsCount: 3)
let productColaTwo = Goods(productName: "Cola Vanila", image: UIImage(named: "cola vanila")!, price: 25, goodsCount: 1)

let productMeatOne = Goods(productName: "Pork", image: UIImage(named: "pork")!, price: 400, goodsCount: 2)
let productMeatChiken = Goods(productName: "Chiken", image: UIImage(named: "chicken")!, price: 200, goodsCount: 3)
let productMeatFish = Goods(productName: "Fish", image: UIImage(named: "fish")!, price: 350, goodsCount: 1)

let productCandySnickers = Goods(productName: "Snickers", image: UIImage(named: "snickers")!, price: 30, goodsCount: 10)
let productCandyMars = Goods(productName: "Mars", image: UIImage(named: "mars")!, price: 18, goodsCount: 4)
let productCandyBounty = Goods(productName: "Bounty", image: UIImage(named: "bounty")!, price: 25, goodsCount: 3)
let productCandyTwix = Goods(productName: "Twix", image: UIImage(named: "twix")!, price: 20, goodsCount: 5)


protocol NewGoodsProtocol {
    var productName: [String] {get}
    var image: [UIImage] {get}
    var price: [Double] {get set}
    var goodsCount: [Int] {get set}
}


struct NewGoods: NewGoodsProtocol {
    var productName: [String] = ["Lays Cheese", "Lays Bekon", "Lays Salt", "Cola Classic", "Cola Vanila", "Pork", "Chiken", "Fish", "Snickers", "Mars", "Bounty", "Twix"]

    var image: [UIImage] = [UIImage(named: "lays cheese")!, UIImage(named: "lays bekon")!, UIImage(named: "lays salt")!, UIImage(named: "cola classic")!, UIImage(named: "cola vanila")!, UIImage(named: "pork")!, UIImage(named: "chicken")!, UIImage(named: "fish")!, UIImage(named: "snickers")!, UIImage(named: "mars")!, UIImage(named: "bounty")!, UIImage(named: "twix")!]

    var price: [Double] = [80, 78, 75, 20, 25, 400, 200, 350, 30, 25, 20]

    var goodsCount: [Int] = [2,4,5,6,3,1,4,6,3,1,5,3]



}
