//
//  QuestionPresentation.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 17.12.2023.
//

import Foundation

// MARK: - QuestionPresentation
struct QuestionPresentation {
    let questions: [QuestionDetail]

    init(from questionList: QuestionList) {
        self.questions = questionList.questions.enumerated().map { index, question in
            QuestionDetail(
                questionNumber: index + 1,
                questionText: question.question,
                questionAnswers: [question.answers.a, question.answers.b] + [question.answers.c, question.answers.d].compactMap { $0 },
                correctAnswerText: QuestionPresentation.getCorrectAnswerText(from: question.answers, correctAnswerKey: question.correctAnswer),
                questionImageURL: question.questionImageURL,
                score: question.score
            )
        }
    }

    private static func getCorrectAnswerText(from answers: Answers, correctAnswerKey: String) -> String {
        switch correctAnswerKey {
        case "A":
            return answers.a
        case "B":
            return answers.b
        case "C":
            return answers.c ?? ""
        case "D":
            return answers.d ?? ""
        default:
            return ""
        }
    }
}

struct QuestionDetail {
    let questionNumber: Int
    let questionText: String
    let questionAnswers: [String]
    let correctAnswerText: String
    let questionImageURL: String?
    let score: Int
}
