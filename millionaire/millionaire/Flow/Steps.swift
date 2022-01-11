//
//  Steps.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 21.12.2021.
//

import Foundation
import UIKit

public enum Steps {
  case initial(window: UIWindow)
  case startGame
  case gameOver
  case showInfo(value: String)
  case result
  case setting
  case newQuestion
}
