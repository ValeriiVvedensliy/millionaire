//
//  CreationViewController.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 10.01.2022.
//

import UIKit

class CreationViewController: UIViewController {

  @IBOutlet weak var question: UITextView!
  @IBOutlet weak var answerA: UITextField!
  @IBOutlet weak var answerB: UITextField!
  @IBOutlet weak var answerC: UITextField!
  @IBOutlet weak var answerD: UITextField!
  @IBOutlet weak var trueAnswer: UIButton!
  private var answer = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpView()
  }

  private func setUpView() {
    setUpGradient()
    setUpNavigationBarRightButton()
    setUpPopUpButton()
  }
  
  private func setUpPopUpButton() {
    let optionsClosure = { (action: UIAction) in
      self.answer = action.title
    }
    trueAnswer.menu = UIMenu(children: [
      UIAction(title: "D", handler: optionsClosure),
      UIAction(title: "C", handler: optionsClosure),
      UIAction(title: "B", handler: optionsClosure),
      UIAction(title: "A", handler: optionsClosure)
    ])
    
    trueAnswer.setTitle("Выбирете верный ответ", for: .normal)
  }

  private func setUpGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [UIColor.Purpure.cgColor, UIColor.Blue.cgColor]
    view.layer.insertSublayer(gradientLayer, at: 0)
  }
  
  private func setUpNavigationBarRightButton() {
    let rightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 68, height: 42))
    rightBtn.backgroundColor = .clear
    rightBtn.setTitle("Добавить", for: .normal)
    rightBtn.setTitleColor(.green, for: .normal)
    rightBtn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
  }

  @objc
  func rightBtnClick(sender: UIButton)
  {
    let question = Question(
      question: self.question.text,
      answers: [
        answerA.text ?? "",
        answerB.text ?? "",
        answerC.text ?? "",
        answerD.text ?? ""
      ],
      answer: getTrueAnswer()
    )
    QuestionSource.shared.addQuestion(question: question)
  }

  private func getTrueAnswer() -> String {
    switch answer {
    case "A":
      return answerA.text ?? ""
    case "B":
      return answerB.text ?? ""
    case "C":
      return answerC.text ?? ""
    case "D":
      return answerD.text ?? ""
    default:
      return ""
    }
  }
}
