//
//  TableCell.swift
//  Stocks
//
//  Created by Iliya Kuznetsov on 08.07.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    var isObserving = false;
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBOutlet weak var secondSection: UIView!
    
    @IBOutlet weak var openCell: UIImageView!
    
    
    class var expandedHeight: CGFloat {get {return 180} }
    class var defaultHeight: CGFloat {get {return 95} }
    
    func checkHeight() {
        secondSection.hidden = ( frame.size.height < TableCell.expandedHeight)
        openCell.hidden = !(frame.size.height < TableCell.expandedHeight)
    }
    
    func watchFrameChanges() {
        if !isObserving {
        addObserver(self, forKeyPath: "frame", options: .New, context: nil)
        checkHeight()
            isObserving = true
        }
    }
    
    func ignoreFrameChanges() {
        if isObserving {
        removeObserver(self, forKeyPath: "frame")
        isObserving = false
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "frame" {
            checkHeight()
        }
    }
}
