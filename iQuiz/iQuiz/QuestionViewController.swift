//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Annie Lace on 5/5/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import UIKit

class QuestionViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet weak var QuizNameLable: UILabel!
    @IBOutlet weak var questionText: UILabel!
    var data : DataModel? = nil
    var quizIndex : Int = -1
    var questionIndex: Int = -1
    var answerIndex : Int = 0
    var pickerData : [String] = []
    @IBOutlet weak var answerPicker: UIPickerView!
    var correctAnswers : Int = 0
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        answerIndex = row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(quizIndex > -1)
        {
            QuizNameLable.text = data!.quizCells[quizIndex].title
            questionText.text = data!.quizCells[quizIndex].questions[questionIndex].text
            pickerData = data!.quizCells[quizIndex].questions[questionIndex].answers
        }
        
        self.answerPicker.dataSource = self
        self.answerPicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "showAnswerSegue")
        {
            let answerViewController = segue.destinationViewController as! AnswerViewController
            answerViewController.quizIndex = quizIndex
            answerViewController.questionIndex = questionIndex
            answerViewController.answerIndex = answerIndex
            answerViewController.correctAnswers = correctAnswers
            answerViewController.data = data!
        }
        else if(segue.identifier == "backSegue")
        {
            let viewController = segue.destinationViewController as! ViewController
            viewController.data = data!
        }
    }
}