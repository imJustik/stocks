//
//  Envato.swift
//  Stocks
//
//  Created by Iliya Kuznetsov on 10.07.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.


// application key: b1qnrINKr6lElbsEuahhbDtSQbE2bYqi
// token: XjoBlj5j6oIo6m8dSV4BhPUCcl5acJQh
//OAuth client ID: comkuznetsovstocks-wuojgioj




// app: z42OtCGbRmyEJp981PlPTgXwhXtAlNea
// OAuth: comtreedeostocks-9hwlxd6c

import OAuthSwift
import Alamofire
import UIKit


class Envato: AccountProtocol {
    var image: UIImage
    var title: String
    var money: Float
    var downloads: Int
    var total: Int
    
    var token: String?
    
    var filled:Bool?
    init() {
        image = UIImage(named: "logo_envato")!
        title = "Envato"
        money = -1
        downloads = 0
        total = 0
    }
    
    func authorization() {  //перенести все ключи в realm, что бы не хранить в открытом виде
        let oauthswift = OAuth2Swift(
            consumerKey:"comtreedeostocks-9hwlxd6c",
            consumerSecret: "z42OtCGbRmyEJp981PlPTgXwhXtAlNea",
            authorizeUrl:   "https://api.envato.com/authorization",
            accessTokenUrl: "https://api.envato.com/token",
            responseType:   "code"
        )
        
        
        WebViewController.targetURL = NSURL(string: "https://api.envato.com/authorization?response_type=code&client_id=comtreedeostocks-9hwlxd6c&redirect_uri=stocks://&state=demoGragon1")
        
        oauthswift.authorize_url_handler = WebViewController()
        oauthswift.authorizeWithCallbackURL(
            NSURL(string:"stocks://")!,
            scope: "user.view",        
            state: "demoGragon1",
            success: { credential, response, parameters in
                print(parameters)
                if let tkn = parameters["access_token"] {
                    self.token = tkn
                    print(tkn)
                    
                    let headers = ["Authorization":" Bearer \(tkn)"]
                    Alamofire.request(.POST, "https://api.envato.com/v1/market/private/user/account.json", headers: headers)
                    .responseJSON { response in
                        debugPrint(response)
                        let dict = response.result.value as! NSDictionary
                        if let account = dict["account"] {
                           let balance = account["balance"] as! String
                            Singleton.sharedInstance.envato.money = Float(balance)!
                        }
                    }
               }
                
                Singleton.sharedInstance.authorizedAccounts.append(Singleton.sharedInstance.envato)
            },
            failure: { error in
                print(error.localizedDescription)
        })
    }
    
}


