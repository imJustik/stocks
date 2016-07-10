//
//  Envato.swift
//  Stocks
//
//  Created by Iliya Kuznetsov on 10.07.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

class Envato: AccountProtocol {
    var image: UIImage
    var title: String
    
    init() {
        image = UIImage(named: "logo_envato")!
        title = "Envato"
    }
}
