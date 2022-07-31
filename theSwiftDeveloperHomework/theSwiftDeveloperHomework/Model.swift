//
//  Model.swift
//  theSwiftDeveloperHomework
//
//  Created by Admin on 31.07.2022.
//

import Foundation

protocol ContactProtocol {
    var name: String {get set}
    var phone: String {get set}
    
}

struct Contact: ContactProtocol {
    var name: String
    
    var phone: String
}
