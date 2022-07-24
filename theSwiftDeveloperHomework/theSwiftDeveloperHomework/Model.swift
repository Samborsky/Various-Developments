//
//  Model.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 18.07.2022.
//

import Foundation
import UIKit

//добавляем линию под нужным UITextField
func line(textField: UITextField) {
    let myLine = CALayer()
    myLine.frame = CGRect(x: 0, y: textField.frame.height, width: 250, height: 2)
    myLine.backgroundColor = UIColor.lightGray.cgColor
    textField.layer.addSublayer(myLine)
}
