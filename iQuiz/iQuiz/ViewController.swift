//
//  ViewController.swift
//  iQuiz
//
//  Created by Annie Lace on 5/2/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoriesTableView: UITableView!
    let data = DataModel()
    
    
    @IBAction func settingsClicked(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Settings go here", message: "", preferredStyle: .Alert);
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil);
        alertController.addAction(defaultAction);
        
        presentViewController(alertController, animated: true, completion: nil);
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return data.categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        let category = data.categories[indexPath.row]
        let image = UIImage(named : category.iconFile)
        
        cell.icon.image = image
        cell.title.text = category.title
        cell.descr.text = category.descr
        
        return cell
    }
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.categoriesTableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

