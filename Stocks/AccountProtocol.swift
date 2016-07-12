//
//  Account.swift
//  Stocks
//
//  Created by Iliya Kuznetsov on 10.07.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

protocol AccountProtocol: AnyObject {
    var image: UIImage {get set}
    var title: String {get set}
    
    var money: Float {get set}
    var downloads: Int {get set}
    var total: Int {get set} //Всего работ, загруженных на сайт пользователем.
    
    var token: String? {get set}
    
    var  filled: Bool? {get set}
    
    func authorization()
    
}

func ==(lhs:AccountProtocol, rhs:AccountProtocol) -> Bool { // Переопределим равенство для обьектов, поддерживающих протокол
    return lhs.filled == rhs.filled
}

