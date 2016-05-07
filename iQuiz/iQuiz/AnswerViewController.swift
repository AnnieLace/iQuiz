//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Annie Lace on 5/5/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import UIKit

class AnswerViewController : UIViewController
{
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var results: UIButton!
    
    var quizIndex : Int = -1
    var questionIndex : Int = -1
    var answerIndex : Int = -1
    var correctAnswers : Int = 0
    
    var data : DataModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let correctAnswer : Int = data!.quizCells[quizIndex].questions[questionIndex].correctAnswer - 1
        questionText.text = data!.quizCells[quizIndex].questions[questionIndex].text
        answerText.text = "\(data!.quizCells[quizIndex].questions[questionIndex].answers[correctAnswer])"
        
        if(answerIndex == correctAnswer)
        {
            resultText.text = "You answered correctly!"
            correctAnswers += 1
        }
        else
        {
            resultText.text = "You answered incorrectly."
        }
        
        if(questionIndex + 1 >= data!.quizCells[quizIndex].questions.count)
        {
            nextQuestion.hidden = true
        }
        else
        {
            results.hidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "nextQuestionSegue")
        {
            let questionViewController = segue.destinationViewController as! QuestionViewController
            questionViewController.quizIndex = quizIndex
            questionViewController.questionIndex = (questionIndex + 1)
            questionViewController.correctAnswers = correctAnswers
            questionViewController.data = data!
        }
        else if(segue.identifier == "resultSegue")
        {
            let resultViewController = segue.destinationViewController as! ResultViewController
            resultViewController.correctAnswers = correctAnswers
            resultViewController.quizIndex = quizIndex
            resultViewController.data = data!
        }
        else if(segue.identifier == "backSegue")
        {
            let viewController = segue.destinationViewController as! ViewController
            viewController.data = data!
        }
    }
}