//
//  TableViewController.swift
//  iQuiz
//
//  Created by Annie Lace on 5/3/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import UIKit

class TableViewController : UITableViewController
{
    let data = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return data.categories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        let category = data.categories[indexPath.row]
        let image = UIImage(named : category.iconFile)
        
        cell.icon.image = image
        cell.title.text = category.title
        cell.descr.text = category.descr
        
        return cell
    }
}