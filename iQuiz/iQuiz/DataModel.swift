//
//  DataModel.swift
//  iQuiz
//
//  Created by Annie Lace on 5/2/16.
//  Copyright © 2016 Annie Lace. All rights reserved.
//

import Foundation

class DataModel
{
    class CategoryCell
    {
        let iconFile: String
        let title: String
        let descr: String
        let questions: [Question]
        
        init(iconFile: String, title: String, descr: String, questions: [Question])
        {
            self.iconFile = iconFile
            self.title = title
            self.descr = descr
            
            self.questions = questions
        }
    }
    
    class Question
    {
        let text: String
        let correctAnswer: Int
        let answers: [String]
        
        init(text: String, correctAnswer: Int, answers: [String])
        {
            self.text = text
            self.correctAnswer = correctAnswer
            self.answers = answers
        }
    }
    
    class PlayerStats
    {
        var score: Int = 0
        var questionsAttempted: Int = 0
        
        init(score: Int, questionsAttempted: Int)
        {
            self.score = score
            self.questionsAttempted = questionsAttempted
        }
        
        func questionCorrect()
        {
            score += 1
            questionsAttempted += 1
        }
        
        func questionIncorrect()
        {
            questionsAttempted += 1
        }
    }
    
    /*let scienceAnswers : [String] = ["One of the four classical elements", "A magical reaction given to us by God","A band that hasn't yet been discovered", "Fire! Fire! Fire! heh-heh"]
    
    let marvelAnswers1 : [String] = ["Tony Stark", "Obadiah Stane","A rock hit by Megadeth","Nobody knows"]
    let marvelAnswers2 : [String] = ["Tony Stark", "Professor X", "The X-Institute", "Erik Lensherr"]
    let marvelAnswers3 :[String] = ["He was bitten by a radioactive spider", "He ate a radioactive spider","He is a radioactive spider","He looked at a radioactive spider"]
    
    let mathAnswers :[String] = ["4", "22", "An irrational number", "Nobody knows"]
    
    let scienceQuestion : [Question] = [Question(text: "What is fire?", correctAnswer: 1, answers: ["One of the four classical elements", "A magical reaction given to us by God","A band that hasn't yet been discovered", "Fire! Fire! Fire! heh-heh"])]
    let marvelQuestions : [Question] = [Question(text: "Who is Iron Man?", correctAnswer: 1, answers: ["Tony Stark", "Obadiah Stane","A rock hit by Megadeth","Nobody knows"]),
                           Question(text: "Who founded the X-Men", correctAnswer: 2, answers: ["Tony Stark", "Professor X", "The X-Institute", "Erik Lensherr"]),
                           Question(text: "How did Spider-Man get his powers?", correctAnswer: 1, answers: ["He was bitten by a radioactive spider", "He ate a radioactive spider","He is a radioactive spider","He looked at a radioactive spider"])]
    let mathQuestion :[Question] = [Question(text: "What is 2+2?", correctAnswer: 1, answers: ["4", "22", "An irrational number", "Nobody knows"])]*/
    
    let categories = [
        CategoryCell(iconFile: "shield.jpg", title: "Marvel Super Heroes", descr: "Avengers, Assemble!", questions: [Question(text: "Who is Iron Man?", correctAnswer: 1, answers: ["Tony Stark", "Obadiah Stane","A rock hit by Megadeth","Nobody knows"]),
            Question(text: "Who founded the X-Men", correctAnswer: 2, answers: ["Tony Stark", "Professor X", "The X-Institute", "Erik Lensherr"]),
            Question(text: "How did Spider-Man get his powers?", correctAnswer: 1, answers: ["He was bitten by a radioactive spider", "He ate a radioactive spider","He is a radioactive spider","He looked at a radioactive spider"])]),
        CategoryCell(iconFile: "math.jpg", title: "Mathematics", descr: "Did you pass the thrid grade?", questions: [Question(text: "What is 2+2?", correctAnswer: 1, answers: ["4", "22", "An irrational number", "Nobody knows"])]),
        CategoryCell(iconFile: "lab.jpg", title: "Science", descr: "Because SCIENCE!", questions: [Question(text: "What is fire?", correctAnswer: 1, answers: ["One of the four classical elements", "A magical reaction given to us by God","A band that hasn't yet been discovered", "Fire! Fire! Fire! heh-heh"])])
    ]
    
}
