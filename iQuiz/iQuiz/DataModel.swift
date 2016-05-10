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
    //science, marvel, math
    let iconFiles = ["lab.jpg", "shield.jpg", "math.jpg"]
    
    let categories = [
        CategoryCell(iconFile: "shield.jpg", title: "Marvel Super Heroes", descr: "Avengers, Assemble!", questions: [Question(text: "Who is Iron Man?", correctAnswer: 1, answers: ["Tony Stark", "Obadiah Stane","A rock hit by Megadeth","Nobody knows"]),
            Question(text: "Who founded the X-Men", correctAnswer: 2, answers: ["Tony Stark", "Professor X", "The X-Institute", "Erik Lensherr"]),
            Question(text: "How did Spider-Man get his powers?", correctAnswer: 1, answers: ["He was bitten by a radioactive spider", "He ate a radioactive spider","He is a radioactive spider","He looked at a radioactive spider"])]),
        CategoryCell(iconFile: "math.jpg", title: "Mathematics", descr: "Did you pass the thrid grade?", questions: [Question(text: "What is 2+2?", correctAnswer: 1, answers: ["4", "22", "An irrational number", "Nobody knows"])]),
        CategoryCell(iconFile: "lab.jpg", title: "Science", descr: "Because SCIENCE!", questions: [Question(text: "What is fire?", correctAnswer: 1, answers: ["One of the four classical elements", "A magical reaction given to us by God","A band that hasn't yet been discovered", "Fire! Fire! Fire! heh-heh"])])
    ]
    
    var quizCells : [CategoryCell] = []
    
    //init()
    //{
       
    //}
    
    func populateQuizData(url : String, completion: (quiz: [CategoryCell]?, error: NSError? )->())
    {
        let requestURL: NSURL = NSURL(string: url)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                do{
                    var quizInfo : [CategoryCell] = []
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    for(var i = 0; i < json.count!; i += 1)
                    {
                        var questionArray : [Question] = []
                        if let quiz = json[i] as? [String : AnyObject]
                        {
                            if let title = quiz["title"] as? String {
                                if let desc = quiz["desc"] as? String {
                                    if let questions = quiz["questions"] as? [[String : AnyObject]] {
                                        for question in questions {
                                            if let text = question["text"] as? String {
                                                if let answer = question["answer"] as? String {
                                                    if let answers = question["answers"] as? [String] {
                                                        questionArray.append(Question(text: text, correctAnswer: Int(answer)!, answers: answers))
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    quizInfo.append(CategoryCell(iconFile : self.iconFiles[i], title : title, descr : desc, questions: questionArray))
                                }
                            }
                            
                        }
                    }
                    completion(quiz: quizInfo, error: nil)
                    
                } catch let caught as NSError {
                    completion(quiz: nil, error: caught)
                }
            }
        
        }
        task.resume()
    }
}
