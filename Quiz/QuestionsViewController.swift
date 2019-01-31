//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by retina on 28/01/19.
//  Copyright © 2019 retina. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var question: UITextField!
    @IBOutlet var correctAnswer: UITextField!
    @IBOutlet var answer2: UITextField!
    @IBOutlet var answer3: UITextField!
    @IBOutlet var button: UIButton!
    var position: Int? = nil
    var quizController = QuizController()
    
    @IBAction func add() {
        if (button.titleLabel?.text == "Add") {
            let quizController = QuizController()
            if (quizController.addQuestion(question: question.text!, correctAnswer: correctAnswer.text!, answer2: answer2.text!, answer3: answer3.text!)) {
                showMessage(message: "Question successfully added")
            }
        } else {
            if (quizController.updateQuestion(question: question.text!, correctAnswer: correctAnswer.text!, answer2: answer2.text!, answer3: answer3.text!, position: position!)) {
                showMessage(message: "Updated!")
            }
        }
        
    }

    func showMessage(message: String) {
        let alert = UIAlertController(title: "Aviso", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        resetForm()
    }
    
    func loadQuestion(question: QuestionDTO?) {
        self.question.text = question?.question
        self.correctAnswer.text = question?.a1
        self.answer2.text = question?.a2
        self.answer3.text = question?.a3
    }
    
    func resetForm() {
        self.question.text = ""
        self.correctAnswer.text = ""
        self.answer2.text = ""
        self.answer3.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (position != nil) {
            loadQuestion(question: quizController.getQuestion(index: position!))
            button.setTitle("Update", for: UIControlState.normal)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
