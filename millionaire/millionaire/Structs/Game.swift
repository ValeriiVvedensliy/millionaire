//
//  Game.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 06.01.2022.
//

import Foundation

class Game {
  static let shared = Game()
  var gameSession: GameSession?
  private let recordsCaretaker = RecordsCaretaker()
  private(set) var records: [Record] {
      didSet {
          recordsCaretaker.save(records: self.records)
      }
  }

  private init() {
      self.records = self.recordsCaretaker.retrieveRecords()
  }

  func startGameSession(questionsCount: Int) {
    gameSession = GameSession(countQuestions: questionsCount)
  }

  func addRecord(record: Record) {
    records.append(record)
  }
  
  func clearSession() {
    records = []
    gameSession = nil
  }
}
