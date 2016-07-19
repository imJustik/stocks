//
//  ViewController.swift
//  Stocks
//
//  Created by Iliya Kuznetsov on 08.07.16.
//  Copyright © 2016 Iliya Kuznetsov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cellId = "cell"
    var selectedIndexPath: NSIndexPath?

    
    override func viewDidAppear(animated: Bool) {
    
        self.tableView.reloadData()
        
        
        //set backgroud color
        tableView.opaque = false
        tableView.backgroundColor = UIColor(red: 36/255, green: 51/255, blue: 64/255, alpha: 1)
        tableView.backgroundView = nil;
        
        
      
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
       self.navigationController!.navigationBar.translucent = false //убирает прозрачность у navigation bar
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Singleton.sharedInstance.authorizedAccounts.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! TableCell
        
        cell.logoImage.image = Singleton.sharedInstance.authorizedAccounts[indexPath.item].image
        cell.titleLable.text = Singleton.sharedInstance.authorizedAccounts[indexPath.item].title
        cell.moneyLabel.text = String("\(Singleton.sharedInstance.authorizedAccounts[indexPath.item].money)$")
        
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        var indexPaths: Array<NSIndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        
        if indexPaths.count > 0 {
            tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        }
        
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! TableCell).watchFrameChanges()
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! TableCell).ignoreFrameChanges()
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            return TableCell.expandedHeight
        } else {
            return TableCell.defaultHeight
        }
    }
    
  
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .Normal, title: "Delete") { ( action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
        Singleton.sharedInstance.authorizedAccounts.removeAtIndex(indexPath.item)
        self.tableView.reloadData()
           
        }
        deleteAction.backgroundColor = UIColor.redColor()
        return [deleteAction]
        
    }
    
    
    //spacing
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clearColor()
        header.frame.size = CGSize(width: self.view.frame.size.width, height: 10)
        
        return header
    }
    
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clearColor()
    }
    
    //back button
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let backItem = UIBarButtonItem()
//        backItem.title = ""
//        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
       }

