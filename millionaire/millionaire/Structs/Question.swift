//
//  Question.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 21.12.2021.
//

import Foundation


struct Question: Codable {
  let question: String
  let answers: [String]
  let answer: String
}
