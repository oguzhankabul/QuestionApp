//
//  QuestionPageViewModelTests.swift
//  QuestionAppTests
//
//  Created by Oğuzhan Kabul on 18.12.2023.
//

import Foundation

import XCTest
@testable import QuestionApp

class QuestionPageViewModelTests: XCTestCase {
    var viewModel: QuestionPageViewModel!
    var router: QuestionPageRouter!
    
    override func setUp() {
        super.setUp()
        let sampleQuestions = [
            Question(question: "Sample Question 1", answers: Answers(a: "A", b: "B", c: "C", d: "D"), questionImageURL: "mock url", correctAnswer: "A", score: 10),
            Question(question: "Sample Question 2", answers: Answers(a: "A", b: "B", c: "C", d: "D"), questionImageURL: "mock ur2", correctAnswer: "B", score: 20)
        ]
        let questionList = QuestionList(questions: sampleQuestions)
        let questionPresentation = QuestionPresentation(from: questionList)
        router = QuestionPageRouter()
        viewModel = QuestionPageViewModel(router: router, networkService: MockNetworkService(), questionPresentation: questionPresentation)
    }
    
    override func tearDown() {
        viewModel = nil
        router = nil
        super.tearDown()
    }
    
    func testQuestionDetails() {
        XCTAssertNotNil(viewModel.questions, "Questions should not be nil")
        XCTAssertEqual(viewModel.questions.count, 2, "There should be 2 question")
        
        let firstQuestion = viewModel.questions.first
        XCTAssertNotNil(firstQuestion, "First question should not be nil")
        XCTAssertEqual(firstQuestion?.questionText, "Sample Question 1", "First question text should match")
        XCTAssertEqual(firstQuestion?.questionAnswers.count, 4, "First question should have 4 answers")
        XCTAssertEqual(firstQuestion?.correctAnswerText, "A", "First question correct answer should match")
        XCTAssertEqual(firstQuestion?.score, 10, "First question score should match")
    }
    
    func testGetShuffledAnswers() {
        let shuffledAnswers = viewModel.getShuffledAnswers()
        XCTAssertNotNil(shuffledAnswers, "Shuffled answers should not be nil")
        XCTAssertEqual(shuffledAnswers.count, 4, "There should be 4 shuffled answers")
        XCTAssertTrue(viewModel.questions[viewModel.currentQuestionNumber].questionAnswers.contains(shuffledAnswers[0]), "Shuffled answers should contain original answers")
    }
    
    func testAnswerQuestionAction() {
        viewModel.answerQuestionAction(answer: "A")
        XCTAssertEqual(viewModel.totalScore, 10, "Total score should be 10 for correct answer")

        viewModel.goToNextQuestion()
        viewModel.answerQuestionAction(answer: "C")
        XCTAssertEqual(viewModel.totalScore, 10, "Total score should remain 10 for wrong answer")
    }
    
    func testGoToNextQuestion() {
        viewModel.goToNextQuestion()
        XCTAssertEqual(viewModel.currentQuestionNumber, 1, "Current question number should be 1 after goToNextQuestion")

        viewModel.goToNextQuestion()
        XCTAssertNil(viewModel.currentQuestion, "Current question should be nil after last question")
    }

}

