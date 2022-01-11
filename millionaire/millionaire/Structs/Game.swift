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
  private(set) var queue: Queue = .def

  private(set) var records: [Record] {
      didSet {
          recordsCaretaker.save(records: self.records)
      }
  }

  private init() {
      self.records = self.recordsCaretaker.retrieveRecords()
  }

  func startGameSession(questionsCount: Int, hintUsageFacade: HintUsageFacade) {
    gameSession = GameSession(countQuestions: questionsCount, hintUsageFacade: hintUsageFacade)
  }

  func addRecord(record: Record) {
    records.append(record)
  }

  func setQueue(queue: Queue) {
    self.queue = queue
  }
  
  func clearSession() {
    records = []
    gameSession = nil
  }
}
