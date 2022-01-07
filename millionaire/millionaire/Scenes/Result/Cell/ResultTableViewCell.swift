//
//  ResultTableViewCell.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 07.01.2022.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  func setUpCell(date: Date, score: Int) {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.timeStyle = .none
    formatter.dateStyle = .full
    formatter.timeZone = TimeZone.current
    let onlyDate = formatter.string(from: date)
    scoreLabel.text = "Score - \(score)"
    dateLabel.text = "Date - \(onlyDate)"
  }
}
