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
    let data = DataModel()
    var quizIndex : Int = -1
    var questionIndex: Int = -1
    var answerIndex : Int = 1
    var pickerData : [String] = []
    @IBOutlet weak var answerPicker: UIPickerView!
    
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
        // Do view setup here.
        
        if(quizIndex > -1)
        {
            QuizNameLable.text = data.categories[quizIndex].title
            questionText.text = data.categories[quizIndex].questions[questionIndex].text
            pickerData = data.categories[quizIndex].questions[questionIndex].answers
        }
        
        self.answerPicker.dataSource = self
        self.answerPicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}