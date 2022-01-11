//
//  GameSession.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 06.01.2022.
//

import Foundation

struct GameSession {
  var countAnsweers: Int
  var countQuestions: Int
  var mony: Decimal
  var coleFriendsIsUsed: Bool
  var hallPromptIsUsed: Bool
  var fiftyFiftyIsUsed: Bool
  var hintUsageFacade: HintUsageFacade
  
  init (countQuestions: Int, hintUsageFacade: HintUsageFacade) {
    self.countQuestions = countQuestions
    self.countAnsweers = 0
    self.mony = 0
    self.coleFriendsIsUsed = false
    self.hallPromptIsUsed = false
    self.fiftyFiftyIsUsed = false
    self.hintUsageFacade = hintUsageFacade
  }
}
