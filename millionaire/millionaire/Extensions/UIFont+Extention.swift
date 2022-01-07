//
//  UIFont+Extention.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 07.01.2022.
//

import Foundation
import UIKit

extension UIFont {
  func lineSpacing(sketchLineHeight: CGFloat) -> CGFloat {
    sketchLineHeight - lineHeight
  }
}


