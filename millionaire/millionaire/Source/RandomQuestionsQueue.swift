//
//  RandomQuestionsQueue.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 09.01.2022.
//

import Foundation

class RandomQuestionsQueue: QuestionsQueueStrategy {
  func getQuesrionsQueue() -> [Question] {
    QuestionSource.shared.questions.shuffled()
  }
}
