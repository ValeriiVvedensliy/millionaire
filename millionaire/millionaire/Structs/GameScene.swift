//
//  GameScene.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 06.01.2022.
//

import Foundation

class GameScene {
  weak var gameDelegate: GameDelegate?
  
  func isAnswerTrue(answer: String, trueAnswer: String) -> Bool {
    let isTrue = answer.contains(trueAnswer)
    upDateGameProgress(isTrue: isTrue)
    
    return isTrue
  }
  
  func usehelperPeople() {
    guard let gameDelegate = gameDelegate else { return }

    gameDelegate.usehelperPeople()
  }
  
  func usehelperFifty() {
    guard let gameDelegate = gameDelegate else { return }

    gameDelegate.usehelperFifty()
  }
  
  func usehelperFriend() {
    guard let gameDelegate = gameDelegate else { return }

    gameDelegate.usehelperFriend()
  }
  
  func gameEnd() {
    guard let gameDelegate = gameDelegate else { return }

    gameDelegate.gameEnd()
  }
  
  private func upDateGameProgress(isTrue: Bool) {
    guard let gameDelegate = gameDelegate else { return }

    gameDelegate.updateProgresGame(isTrue: isTrue)
  }
}
