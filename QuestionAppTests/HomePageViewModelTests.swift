//
//  QuestionAppTests.swift
//  QuestionAppTests
//
//  Created by Oğuzhan Kabul on 15.12.2023.
//

import XCTest
@testable import QuestionApp

class HomePageViewModelTests: XCTestCase {
    var viewModel: HomePageViewModel!
    var mockNetworkService: MockNetworkService!
    var router: HomePageRouter!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        router = HomePageRouter()
        viewModel = HomePageViewModel(router: router, networkService: mockNetworkService)
    }

    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchQuestions() async {
        viewModel.getQuizList()
        try? await Task.sleep(nanoseconds: 1_000_000_000)

        let questions = viewModel.questions
        XCTAssertNotNil(questions, "Questions should not be nil")
        XCTAssertGreaterThan(questions?.questions.count ?? 0, 0, "Questions count should be greater than 0")

        if let firstQuestion = questions?.questions.first {
            XCTAssertEqual(firstQuestion.question, "Dünyanın 6 Harikası’ndan biri olan İskenderiye Feneri nerede bulunur?", "First question text should match")
            XCTAssertEqual(firstQuestion.answers.a, "Libya", "First question answer A should match")
            XCTAssertEqual(firstQuestion.correctAnswer, "D", "First question correct answer should match")
            XCTAssertEqual(firstQuestion.score, 200, "First question score should match")
        }

        if let secondQuestion = questions?.questions[1] {
            XCTAssertEqual(secondQuestion.question, "Dünyaca ünlü bir tablo olan Çığlık kimin eseri?", "Second question text should match")
            XCTAssertEqual(secondQuestion.answers.a, "Edward Munch", "Second question answer A should match")
            XCTAssertEqual(secondQuestion.correctAnswer, "A", "Second question correct answer should match")
            XCTAssertEqual(secondQuestion.score, 100, "Second question score should match")
        }
    }
}

