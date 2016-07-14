//
//  AddStockCollectionView.swift
//  Stocks
//
//  Created by Iliya Kuznetsov on 08.07.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

class AddStockCollectionView: UICollectionViewController
{
    private let reuseIdentifier = "StockCell"
    private let headerIdentifier = "headerIdentifier"
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 5.0, bottom: 50.0, right: 5.0)
    
    private var stocks = [AccountProtocol]()
    
    override func viewDidLoad() {
         stocks = Singleton.sharedInstance.returnAllStocks()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Singleton.sharedInstance.returnAllStocks().count
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! StockCell
            cell.logoImage.image = stocks[indexPath.item].image
            cell.titleLabel.text = stocks[indexPath.item].title
        
        return cell
    }
}

extension AddStockCollectionView : UICollectionViewDelegateFlowLayout{
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    

    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //проверка убрана для теста UI
        
        //if (Singleton.sharedInstance.authorizedAccounts.indexOf({$0 == Singleton.sharedInstance.envato as AccountProtocol}) == nil) {
            stocks[indexPath.item].authorization()
      //  }
        
    }
    
    
    
    
    
}