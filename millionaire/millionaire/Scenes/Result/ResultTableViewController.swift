//
//  ResultTableViewController.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 07.01.2022.
//

import UIKit

class ResultTableViewController: UITableViewController {
  private let records = Game.shared.records

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultTableViewCell")
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    records.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: "ResultTableViewCell",
      for: indexPath) as? ResultTableViewCell else { return UITableViewCell() }
    
    let record = records[indexPath.row]
    cell.setUpCell(date: record.date, score: record.score)
    return cell
  }
}
