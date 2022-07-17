//
//  CustomView.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 13.07.2022.
//

import UIKit

class CustomView: UIView {


    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let logo = UIBezierPath()
        logo.move(to: CGPoint(x: 50, y: 50))
        logo.addLine(to: CGPoint(x: 70, y: 70))
        logo.addLine(to: CGPoint(x: 20, y: 70))
        
    }



}
