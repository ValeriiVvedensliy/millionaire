//
//  Question.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 21.12.2021.
//

import Foundation


struct Question {
  let question: String
  let answers: [String]
  let answer: String

  init(question: String, answers: [String], answer: String) {
    self.question = question
    self.answers = answers
    self.answer = answer
  }
}
