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
    var data : DataModel? = nil
    
    var textField : UITextField? = nil
    
    func configurationTextField(textField: UITextField!)
    {
        self.textField = textField!
        self.textField!.placeholder = "url"
    }
    
    @IBAction func settingsClicked(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Enter Url", message: "Enter the url to load quiz from", preferredStyle: .Alert);
        alertController.addTextFieldWithConfigurationHandler(configurationTextField)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler:{ (UIAlertAction)in
            self.data!.populateQuizData(self.textField!.text!) {(quiz, error) -> () in
                if(quiz != nil)
                {
                    self.data!.quizCells = quiz!
                    self.categoriesTableView!.reloadData()
                }
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler : nil)
        alertController.addAction(defaultAction);
        alertController.addAction(cancelAction);
        
        presentViewController(alertController, animated: true, completion: nil);
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return data!.quizCells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        let category = data!.quizCells[indexPath.row]
        let image = UIImage(named : category.iconFile)
        
        cell.icon.image = image
        cell.title.text = category.title
        cell.descr.text = category.descr
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.data == nil)
        {
            self.data = DataModel()
        }
        
        if(self.data!.quizCells.count == 0)
        {
            self.data!.populateQuizData("http://tednewardsandbox.site44.com/questions.json") {(quiz, error) -> () in
                if(quiz != nil)
                {
                    self.data!.quizCells = quiz!
                    self.categoriesTableView!.reloadData()
                }
            }
        }
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "quizSegue")
        {
            let questionViewController = segue.destinationViewController as! QuestionViewController
            questionViewController.quizIndex = (categoriesTableView.indexPathForSelectedRow?.row)!
            questionViewController.questionIndex = 0
            questionViewController.data = data
        }
    }
}

