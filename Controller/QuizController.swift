//
//  QuizController.swift
//  Quiz
//
//  Created by retina on 28/01/19.
//  Copyright © 2019 retina. All rights reserved.
//

import Foundation

class QuizController {
    
    static var quiz = Quiz()
    static var currentQuestion: Int = 0
    
    func addQuestion(question: Question) -> Bool {
        return QuizController.quiz.addQuestion(question: question)
    }
    
    func addQuestion(question: String, correctAnswer: String, answer2: String, answer3: String) -> Bool {
        let question = Question(question: question, a1: correctAnswer, a2: answer2, a3: answer2)
        return self.addQuestion(question: question)
    }
    
    func updateQuestion(question: String, correctAnswer: String, answer2: String, answer3: String, position: Int) -> Bool {
        let question = Question(question: question, a1: correctAnswer, a2: answer2, a3: answer2)
        return QuizController.quiz.updateQuestion(question: question, position: position)
    }
    
    func nextQuestion() -> QuestionDTO? {
        if (QuizController.currentQuestion + 1 < QuizController.quiz.questions.count) {
            QuizController.currentQuestion += 1
            return getQuestion(index: QuizController.currentQuestion)
        }else{
            return nil
        }
    }
    
    func calculateScore(answer: String, index: Int) -> Int {
        if(QuizController.quiz.questions[index].verifyAnswer(answer: answer)) {
            QuizController.quiz.score += 1
        }
        return QuizController.quiz.score
    }
    
    func getQuestion(index: Int) -> QuestionDTO {
        let question = QuizController.quiz.getQuestion(index: index)
        return QuestionDTO(question: question.question, a1: question.a1, a2: question.a2, a3: question.a3)
    }
    
}
