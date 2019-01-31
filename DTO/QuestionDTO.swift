//
//  QuestionDTO.swift
//  Quiz
//
//  Created by retina on 28/01/19.
//  Copyright © 2019 retina. All rights reserved.
//

import Foundation

class QuestionDTO {
    var question: String
    var a1: String
    var a2: String
    var a3: String
    
    init(question: String, a1: String, a2: String, a3: String) {
        self.question = question
        self.a1 = a1
        self.a2 = a2
        self.a3 = a3
    }
    
    init() {
        self.question = ""
        self.a1 = ""
        self.a2 = ""
        self.a3 = ""
    }
}
