//
//  HomeViewController.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 21.12.2021.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet private var rootView: UIView!
  @IBOutlet private var startBtn: UIButton!
  @IBOutlet private var resultBtn: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }

  private func setUpView() {
    setUpGradient()
    setUpButton()
  }

  private func setUpButton() {
    startBtn.setState(title: "Играть".uppercased())
    resultBtn.setState(title: "Результаты".uppercased())
    startBtn.addTarget(self, action: #selector(startBtnClick), for: .touchUpInside)
    resultBtn.addTarget(self, action: #selector(resultBtnClick), for: .touchUpInside)
  }

  private func setUpGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = rootView.bounds
    gradientLayer.colors = [UIColor.Purpure.cgColor, UIColor.Blue.cgColor]
    rootView.layer.insertSublayer(gradientLayer, at: 0)
  }
  
  @objc
  func startBtnClick(sender: UIButton)
  {
    GameFlow.shared.onNext(step: .startGame)
  }

  @objc
  func resultBtnClick(sender: UIButton)
  {
    GameFlow.shared.onNext(step: .result)
  }
}
