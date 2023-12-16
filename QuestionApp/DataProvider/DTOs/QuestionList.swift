//
//  QuestionList.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import Foundation

// MARK: - QuestionList
struct QuestionList: Codable {
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let question: String
    let answers: Answers
    let questionImageURL: String?
    let correctAnswer: String
    let score: Int

    enum CodingKeys: String, CodingKey {
        case question, answers
        case questionImageURL = "questionImageUrl"
        case correctAnswer, score
    }
}

// MARK: - Answers
struct Answers: Codable {
    let a, b: String
    let c, d: String?

    enum CodingKeys: String, CodingKey {
        case a = "A"
        case b = "B"
        case c = "C"
        case d = "D"
    }
}
