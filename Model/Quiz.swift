//
//  Quiz.swift
//  Quiz
//
//  Created by retina on 28/01/19.
//  Copyright © 2019 retina. All rights reserved.
//

import Foundation


class Quiz {
    var questions: [Question]
    var score: Int = 0
    
    init(questions: [Question]) {
        self.questions = questions
    }
    
    init() {
        self.questions = []
    }
    
    func addQuestion(question: Question) -> Bool{
        questions.append(question)
        return true
    }
    
    func updateQuestion(question: Question, position: Int) -> Bool {
        questions[position] = question
        return true
    }

    func getQuestion(index: Int) -> Question {
        return questions[index]
    }
}
