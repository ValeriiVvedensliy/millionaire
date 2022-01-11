//
//  HintUsageFacade.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 11.01.2022.
//

import Foundation

class HintUsageFacade {
  var question: Question?
  var hintUsedFacade: HintUsedFacade!

  init (hintUsedFacade: HintUsedFacade) {
    self.hintUsedFacade = hintUsedFacade
  }

  func callFriend() {
    hintUsedFacade.calledFriend()
  }
  
  func useAuditoryHelp() {
    hintUsedFacade.usedAuditoryHelp()
  }

  func use50to50Hint() {
    hintUsedFacade.used50to50Hint()
  }
}
