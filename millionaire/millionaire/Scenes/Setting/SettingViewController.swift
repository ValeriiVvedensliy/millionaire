//
//  SettingViewController.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 09.01.2022.
//

import UIKit

class SettingViewController: UIViewController {
  
  @IBOutlet weak var segmentControl: UISegmentedControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpView()
  }
  
  private func setUpView() {
    setUpGradient()
    
    segmentControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
  }
  
  private func setUpGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [UIColor.Purpure.cgColor, UIColor.Blue.cgColor]
    view.layer.insertSublayer(gradientLayer, at: 0)
  }

  @objc
  func segmentedValueChanged(_ sender:UISegmentedControl!) {
    switch sender.selectedSegmentIndex {
    case 0:
      Game.shared.setQueue(queue: .def)
    case 1:
      Game.shared.setQueue(queue: .rendom)
    default:
        break
    }
  }
}
