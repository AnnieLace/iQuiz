//
//  ResultViewController.swift
//  iQuiz
//
//  Created by Annie Lace on 5/5/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import UIKit



class ResultViewController : UIViewController
{
    
    @IBOutlet weak var quizName: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var scoreMessage: UILabel!
    
    var correctAnswers : Int = 0
    var quizIndex : Int = -1
    
    let data = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numQuestions : Int = data.categories[quizIndex].questions.count
        quizName.text = data.categories[quizIndex].title
        scoreText.text = "You scored: \(correctAnswers) out of \(numQuestions)"
        let correctPercent : Double = ((Double)(correctAnswers) / (Double)(numQuestions)) * 100.0
        switch(correctPercent)
        {
            case 0...49.9 : scoreMessage.text = "Try Again!"
            case 50.0...74.9 : scoreMessage.text = "You got most right!"
            case 75.0...99.9 : scoreMessage.text = "Great Job!"
            case 100: scoreMessage.text = "Amazing, perfect score!"
            default : scoreMessage.text = "You completed the quiz!"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}