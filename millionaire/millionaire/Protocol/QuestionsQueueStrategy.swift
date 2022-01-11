//
//  QuestionsQueueStrategy.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 09.01.2022.
//

import Foundation

protocol QuestionsQueueStrategy {
  func getQuesrionsQueue() -> [Question]
}
