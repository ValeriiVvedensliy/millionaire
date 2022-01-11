//
//  GameFlow.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 21.12.2021.
//

import Foundation
import UIKit

class GameFlow: Flow {
  var window: UIWindow!
  var rootViewController: UINavigationController!

  static var shared: GameFlow = {
      let instance = GameFlow()

      return instance
  }()

  init() { }

  func onNext(step: Steps) {
    switch step {
    case .initial(let window):
      goToHomePage(window: window)
    case .startGame:
      goToStartGame()
    case .result:
      goToResult()
    case .gameOver:
      goToRoot()
    case .showInfo(value: let value):
      goToPopUp(value: value)
    case .setting:
      goToSetting()
    case .newQuestion:
      goToCreatingQuestion()
    }
  }

  private func goToHomePage(window: UIWindow) {
    self.window = window
    self.rootViewController = UINavigationController(rootViewController: HomeViewController())
    window.rootViewController = self.rootViewController
    window.makeKeyAndVisible()
  }

  private func goToRoot() {
    rootViewController.viewControllers.last?.dismiss(animated: true, completion: nil)
  }

  private func goToPopUp(value: String) {
    let vc = InfoPopUpViewController(
      titleText: "Подсказка",
      messageText: "Вам советуют выбрать вариант ответа - \(value)",
      confirmButtonText: "ОК"
    )

    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .crossDissolve
    rootViewController.visibleViewController?.present(vc, animated: true)
  }

  private func goToResult() {
    let vc = ResultTableViewController()
    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .crossDissolve
    rootViewController.viewControllers.last?.navigationController?.pushViewController(vc, animated: true)
  }

  private func goToSetting() {
    let vc = SettingViewController()
    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .crossDissolve
    rootViewController.viewControllers.last?.navigationController?.pushViewController(vc, animated: true)
  }

  private func goToCreatingQuestion() {
    let vc = CreationViewController()
    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .crossDissolve
    rootViewController.viewControllers.last?.navigationController?.pushViewController(vc, animated: true)
  }

  private func goToStartGame() {
    let vc = GameViewController()
    vc.modalPresentationStyle = .overFullScreen
    vc.modalTransitionStyle = .crossDissolve
    rootViewController.viewControllers.last?.present(vc, animated: true)
  }
}
