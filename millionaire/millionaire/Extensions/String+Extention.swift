//
//  String+Extention.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 07.01.2022.
//

import Foundation
import UIKit

extension String {
  func centeredAttributedString(
    font: UIFont,
    foreground: UIColor,
    sketchLineHeight: CGFloat
  ) -> NSAttributedString {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    paragraphStyle.lineSpacing = font.lineSpacing(sketchLineHeight: sketchLineHeight)
    let attributes = [
      NSAttributedString.Key.font: font,
      NSAttributedString.Key.paragraphStyle: paragraphStyle,
      NSAttributedString.Key.foregroundColor: foreground
    ]
    return NSAttributedString(string: self, attributes: attributes)
  }
}
