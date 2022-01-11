//
//  QuestionSource.swift
//  millionaire
//
//  Created by Valera Vvedenskiy on 04.01.2022.
//

import Foundation

class QuestionSource {
  static let shared = QuestionSource()
  private let questionCaretaker = QuestionCaretaker()
  
  private(set) var questions: [Question] {
      didSet {
        questionCaretaker.save(question: self.questions)
      }
  }

  init () {
    questions = self.questionCaretaker.retrieveQuestion()
    if questions.count <= 0 {
      questions = [
        Question(
          question: "Кто из этих философов в 1864 году написал музыку на стихи А.С. Пушкина «Заклинание» и «Зимний вечер»?",
          answers: ["Юнг", "Гегель", "Ницше", "Шопенгауэр"],
          answer: "Ницше"
        ),
        Question(
          question: "Сколько раз в сутки подзаводят куранты Спасской башни Кремля?",
          answers: ["Один", "Два", "Три", "Четыре"],
          answer: "Два"
        ),
        Question(
          question: "Кто 1-м получил Нобелевскую премию по литературе?",
          answers: ["Романист", "Драматург", "Поэт", "Эссеист"],
          answer: "Поэт"
        ),
        Question(
          question: "С какой буквы начинаются слова, опубликованные в 16-м томе последнего издания Большой советской энциклопедии?",
          answers: ["М", "Н", "О", "П"],
          answer: "М"
        ),
        Question(
          question: "Кто из перечисленных был пажом во времена Екатерины II?",
          answers: ["Д.И. Фонвизин", "Г.Р. Державин", "А.Н. Радищев", "Н.М. Карамзин"],
          answer: "А.Н. Радищев"
        ),
        Question(
          question: "Какой химический элемент назван в честь злого подземного гнома?",
          answers: ["Гафний", "Кобальт", "Бериллий", "Теллур"],
          answer: "Кобальт"
        ),
        Question(
          question: "В какой из этих столиц бывших союзных республик раньше появилось метро?",
          answers: ["Тбилиси", "Ереван", "Баку", "Минск"],
          answer: "Тбилиси"
        ),
        Question(
          question: "Сколько морей омывают Балканский полуостров?",
          answers: ["3", "4", "5", "6"],
          answer: "6"
        ),
        Question(
          question: "Реки с каким названием нет на территории России?",
          answers: ["Шея", "Уста", "Спина", "Палец"],
          answer: "Спина"
        ),
        Question(
          question: "Что такое лобогрейка?",
          answers: ["Жнейка", "Шапка", "Болезнь", "Печка"],
          answer: "Жнейка"
        )
      ]
    }
  }

  func addQuestion(question: Question) {
    questions.append(question)
  }
}
