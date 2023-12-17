//
//  QuestionViewModel.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import Foundation

import Foundation

protocol QuestionPageViewModelDataSource {
    var questions: [QuestionDetail] { get }
}

protocol QuestionPageViewModelEventSource { }

protocol QuestionPageViewModelProtocol: QuestionPageViewModelDataSource, QuestionPageViewModelEventSource { }

protocol QuestionPageViewModelDelegate: AnyObject {
    func questionDidChange(_ question: QuestionDetail?, totalScore:Int)
}

final class QuestionPageViewModel: BaseViewModel<QuestionPageRouter>, QuestionPageViewModelProtocol {
    
    weak var delegate: QuestionPageViewModelDelegate?
    var networkService: NetworkServiceProtocol
    var questions: [QuestionDetail]
    var currentQuestionNumber = 0
    var totalScore = 0
    var currentQuestion: QuestionDetail? {
        guard currentQuestionNumber < questions.count else { return nil }
        return questions[currentQuestionNumber]
    }
    
    init(router: QuestionPageRouter, networkService: NetworkServiceProtocol, questionPresentation: QuestionPresentation) {
        self.networkService = networkService
        self.questions = questionPresentation.questions
        super.init(router: router)
    }
    
    func getShuffledAnswers() -> [String] {
        return questions[currentQuestionNumber].questionAnswers.shuffled()
    }
    
    func answerQuestionAction(answer: String?) {
        guard let currentQuestion = currentQuestion else { return }
        if answer == currentQuestion.correctAnswerText {
            totalScore += currentQuestion.score
        }
    }
    
    func goToNextQuestion() {
        currentQuestionNumber += 1
        if currentQuestion == nil {
            checkAndSaveHighestScore()
        }
        delegate?.questionDidChange(currentQuestion, totalScore: totalScore)
    }
    
    func pushHomePage() {
        router.pushHomePage(networkService: networkService)
    }
    
    private func checkAndSaveHighestScore() {
        if currentQuestionNumber >= questions.count {
            UserDefaults.saveHighestScore(totalScore)
        }
    }
}
