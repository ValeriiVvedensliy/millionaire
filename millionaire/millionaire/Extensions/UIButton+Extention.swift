//
//  UIButton+Extention.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 22.12.2021.
//

import Foundation
import UIKit

extension UIButton {
  func setState(title: String) {
    self.backgroundColor = .clear
    self.layer.cornerRadius = 16
    self.layer.borderColor = UIColor.lightGray.cgColor
    self.layer.borderWidth = 1
    self.setTitle(title, for: .normal)
  }
}
