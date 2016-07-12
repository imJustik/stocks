//
//  Singleton.swift
//  Stocks
//
//  Created by Iliya Kuznetsov on 10.07.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

class Singleton {
    
    let envato = Envato()
    let shutter = Shutter()
    let istock = iStock()
    
    var authorizedAccounts = [AccountProtocol]()
    
    class var sharedInstance: Singleton {
        struct Single {
            static let instance = Singleton()
        }
        
        return Single.instance
    }
    
    
    init() {
        
    }
    
    func returnAllStocks() -> Array<AccountProtocol> {
        let mass = [envato, shutter, istock] as Array<AccountProtocol>
        return mass
    }
    
}
