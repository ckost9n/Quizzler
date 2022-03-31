//
//  Question.swift
//  Quizzler
//
//  Created by Konstantin on 30.03.2022.
//

import Foundation

struct Question {
    var text: String
    var answer: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
    
    
}
