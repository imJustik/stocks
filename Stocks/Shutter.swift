//
//  Shutter.swift
//  Stocks
//
//  Created by Iliya Kuznetsov on 10.07.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

class Shutter: AccountProtocol {
    var image: UIImage
    var title: String
    var money: Float
    var downloads: Int
    var total: Int
    var token: String?
    
    var filled: Bool?
    
    
    init() {
        image = UIImage(named: "logo_shutter")!
        title = "Shutter stock"
        money = 0
        downloads = 0
        total = 0
    }
    
    func authorization() {
        
    }
}
