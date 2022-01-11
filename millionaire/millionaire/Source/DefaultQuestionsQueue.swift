//
//  DefaultQuestionsQueue.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 09.01.2022.
//

import Foundation

class DefaultQuestionsQueue: QuestionsQueueStrategy {
  func getQuesrionsQueue() -> [Question] {
    QuestionSource.shared.questions
  }
}
