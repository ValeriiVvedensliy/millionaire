//
//  GameViewController.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 21.12.2021.
//

import UIKit

class GameViewController: UIViewController {
  @IBOutlet weak var helperPeopleView: UIImageView!
  @IBOutlet weak var helperFiftyView: UIImageView!
  @IBOutlet weak var helperFriendView: UIImageView!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var answerA: UIButton!
  @IBOutlet weak var answerB: UIButton!
  @IBOutlet weak var answerC: UIButton!
  @IBOutlet weak var answerD: UIButton!
  @IBOutlet weak var questionNumber: UILabel!
  
  private var percent = Observable<Int>(0)
  private var count = 1
  private var questions: [Question]!
  private var currentQuestion: Question!
  private var gameScene: GameScene!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpView()
  }

  private func setUpView() {
    setGameScene()
    setUpSource()
    setUpGradient()
    setUpButton()
    setUpLabel()
    setUpImageView()
    setUpBind()
  }
  
  private func setUpBind() {
    guard let text = self.questionNumber.text  else { return }

    percent.addObserver(self, options: [.new, .initial], closure: { [weak self] (percent, _) in
      self?.questionNumber.text = "\(text) \(self?.count ?? 0), \(percent)%"
    })
  }

  private func setGameScene() {
    gameScene = GameScene()
    gameScene.gameDelegate = self
  }
  
  private func setUpSource() {
    switch Game.shared.queue {
    case .def:
      let defaultQueue = DefaultQuestionsQueue()
      questions = defaultQueue.getQuesrionsQueue()
    case .rendom:
      let randomQuestion = RandomQuestionsQueue()
      questions = randomQuestion.getQuesrionsQueue()
    }

    currentQuestion = questions[0]
    Game.shared.gameSession?.hintUsageFacade.question = currentQuestion
    Game.shared.startGameSession(questionsCount: questions.count, hintUsageFacade: HintUsageFacade(hintUsedFacade: self))
  }
  
  private func setUpButton() {
    answerA.setState(title: "A: " + currentQuestion.answers[0])
    answerA.setTitleColor(.white, for: .normal)
    answerA.addTarget(self, action: #selector(btnTap), for: .touchUpInside)

    answerB.setState(title: "B: " + currentQuestion.answers[1])
    answerB.setTitleColor(.white, for: .normal)
    answerB.addTarget(self, action: #selector(btnTap), for: .touchUpInside)

    answerC.setState(title: "C: " + currentQuestion.answers[2])
    answerC.setTitleColor(.white, for: .normal)
    answerC.addTarget(self, action: #selector(btnTap), for: .touchUpInside)

    answerD.setState(title: "D: " + currentQuestion.answers[3])
    answerD.setTitleColor(.white, for: .normal)
    answerD.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
  }

  private func setUpGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [UIColor.Purpure.cgColor, UIColor.Blue.cgColor]
    view.layer.insertSublayer(gradientLayer, at: 0)
  }

  private func setUpLabel() {
    questionLabel.text = currentQuestion.question
    questionLabel.textColor = .white
  }

  private func setUpImageView() {
    guard let gameSession = Game.shared.gameSession else { return }

    helperPeopleView.setImageState()
    helperFiftyView.setImageState()
    helperFriendView.setImageState()
    helperFiftyView.isHidden = gameSession.fiftyFiftyIsUsed
    helperFriendView.isHidden = gameSession.coleFriendsIsUsed
    helperPeopleView.isHidden = gameSession.hallPromptIsUsed
  
    helperFiftyView.addGestureRecognizer(UITapGestureRecognizer(
      target: self,
      action: #selector(self.handleTapHelperFiftyView(_:)))
    )
    helperFriendView.addGestureRecognizer(UITapGestureRecognizer(
      target: self,
      action: #selector(self.handleTapHelperFriendView(_:)))
    )
    helperPeopleView.addGestureRecognizer(UITapGestureRecognizer(
      target: self,
      action: #selector(self.handleTapHelperPeopleView(_:)))
    )
  }

  private func countPercent() {
    guard let questions = Game.shared.gameSession?.countQuestions,
          let answers = Game.shared.gameSession?.countAnsweers else { return }

    percent.value = (100 * answers) / questions
  }

  @objc
  func handleTapHelperFiftyView(_ sender: UITapGestureRecognizer) {
    Game.shared.gameSession?.hintUsageFacade.use50to50Hint()
    var count = 2
    guard let answerA = answerA.title(for: .normal),
          let answerB = answerB.title(for: .normal),
          let answerC = answerC.title(for: .normal),
          let answerD = answerD.title(for: .normal) else { return }
    
    if !answerA.contains(currentQuestion.answer) && count > 0 {
      self.answerA.isHidden = true
      count = count - 1
    }
    if !answerB.contains(currentQuestion.answer) && count > 0 {
      self.answerB.isHidden = true
      count = count - 1
    }
    if !answerC.contains(currentQuestion.answer) && count > 0 {
      self.answerC.isHidden = true
      count = count - 1
    }
    if !answerD.contains(currentQuestion.answer) && count > 0 {
      self.answerD.isHidden = true
      count = count - 1
    }
  }
  
  @objc
  func handleTapHelperFriendView(_ sender: UITapGestureRecognizer) {
    Game.shared.gameSession?.hintUsageFacade.callFriend()
    GameFlow.shared.onNext(step: .showInfo(value: currentQuestion.answer))
  }
  
  @objc
  func handleTapHelperPeopleView(_ sender: UITapGestureRecognizer) {
    Game.shared.gameSession?.hintUsageFacade.useAuditoryHelp()
    GameFlow.shared.onNext(step: .showInfo(value: currentQuestion.answer))
  }
  
  @objc
  func btnTap(sender: UIButton)
  {
    guard let title = sender.title(for: .normal) else { return }

    if gameScene.isAnswerTrue(answer: title, trueAnswer: currentQuestion.answer) {
      startAnimation(button: sender, color: .green, completion: { [weak self] _ in
        sender.backgroundColor = .clear
        self?.count += 1
        self?.setNextQuestion()
      })
    }
    else {
      startAnimation(button: sender, color: .red, completion: { [weak self] _ in
        self?.gameScene.gameEnd()
        GameFlow.shared.onNext(step: .gameOver)
      })
    }
  }

  private func startAnimation(button: UIButton, color: UIColor, completion: @escaping (Bool) -> Void) {
    UIView.animate(
      withDuration: 1,
      delay: 0,
      options: .allowAnimatedContent,
      animations: { button.backgroundColor = color },
      completion: completion
    )
  }

  private func setNextQuestion() {
    countPercent()
    let currentIndex = questions.firstIndex { value in
      value.answer == currentQuestion.answer
    } ?? questions.count

    if currentIndex < questions.count - 1 {
      currentQuestion = questions[currentIndex + 1]
    }
  
    Game.shared.gameSession?.hintUsageFacade.question = currentQuestion
    updateQuestion()
  }
  
  private func updateQuestion() {
    questionLabel.text = currentQuestion.question
    answerA.setTitle("A: " + currentQuestion.answers[0], for: .normal)
    answerB.setTitle("B: " + currentQuestion.answers[1], for: .normal)
    answerC.setTitle("C: " + currentQuestion.answers[2], for: .normal)
    answerD.setTitle("D: " + currentQuestion.answers[3], for: .normal)

    answerA.isHidden = false
    answerB.isHidden = false
    answerC.isHidden = false
    answerD.isHidden = false
  }
}

extension GameViewController: HintUsedFacade {
  func calledFriend() {
    Game.shared.gameSession?.coleFriendsIsUsed = true
    helperFriendView.isHidden = true
  }
  
  func usedAuditoryHelp() {
    Game.shared.gameSession?.hallPromptIsUsed = true
    helperPeopleView.isHidden = true
  }
  
  func used50to50Hint() {
    Game.shared.gameSession?.fiftyFiftyIsUsed = true
    helperFiftyView.isHidden = true
  }
}

extension GameViewController: GameDelegate {
  func gameEnd() {
    countPercent()
    let record = Record(date: Date(), score: percent.value)
    Game.shared.addRecord(record: record)
  }

  func updateProgresGame(isTrue: Bool) {
    guard isTrue == true,
      let mony = Game.shared.gameSession?.mony,
      let count = Game.shared.gameSession?.countAnsweers else { return }

    Game.shared.gameSession?.mony = 100_000 + mony
    Game.shared.gameSession?.countAnsweers = count + 1
  }
}
