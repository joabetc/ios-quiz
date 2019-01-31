//
//  AnswerQuizViewController.swift
//  Quiz
//
//  Created by retina on 28/01/19.
//  Copyright © 2019 retina. All rights reserved.
//

import UIKit

class AnswerQuizViewController: UIViewController {
    
    @IBOutlet var question: UILabel!
    @IBOutlet var answer1: UIButton!
    @IBOutlet var answer2: UIButton!
    @IBOutlet var answer3: UIButton!
    var quizController = QuizController()
    @IBOutlet var score: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuestion(question: quizController.getQuestion(index: 0))

        // Do any additional setup after loading the view.
    }
    
    func loadQuestion(question: QuestionDTO?) {
        let question = question
        if (question == nil) {
            showMessage(message: "Finished!")
        } else {
            self.question.text = question?.question
            self.answer1.setTitle(question?.a1, for: UIControlState.normal)
            self.answer2.setTitle(question?.a2, for: UIControlState.normal)
            self.answer3.setTitle(question?.a3, for: UIControlState.normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answer1Button() {
        updateScore(answer: (self.answer1.titleLabel?.text)!)
    }
    
    @IBAction func answer2Button() {
        updateScore(answer: (self.answer2.titleLabel?.text)!)
    }
    
    @IBAction func answer3Button() {
        updateScore(answer: (self.answer3.titleLabel?.text)!)
    }
    
    func updateScore(answer: String) {
        let currentQuestion = QuizController.currentQuestion
        score.text = String(quizController.calculateScore(answer: answer, index: currentQuestion))
        if (QuizController.quiz.getQuestion(index: currentQuestion).verifyAnswer(answer: answer)) {
            showMessage(message: "Congrats!")
        } else {
            showMessage(message: "Sorry!")
        }
        loadQuestion(question: quizController.nextQuestion())
    }
    
    func showMessage(message: String) {
        let alert = UIAlertController(title: "Warn", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
