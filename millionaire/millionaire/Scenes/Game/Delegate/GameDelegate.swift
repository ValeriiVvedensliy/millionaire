//
//  GameDelegate.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 06.01.2022.
//

import Foundation

protocol GameDelegate: AnyObject {
  func updateProgresGame(isTrue: Bool)
  func gameEnd()
}
