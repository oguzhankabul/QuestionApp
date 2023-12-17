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
    
    var networkService: NetworkServiceProtocol
    var questions: [QuestionDetail]
    var currentQuestionNumber = 0
    var totalScore = 0
    weak var delegate: QuestionPageViewModelDelegate?
    
    init(router: QuestionPageRouter, networkService: NetworkServiceProtocol, questionPresentation: QuestionPresentation) {
        self.networkService = networkService
        self.questions = questionPresentation.questions
        super.init(router: router)
    }
    
    func getShuffledAnswers() -> [String] {
        return questions[currentQuestionNumber].questionAnswers.shuffled()
    }
    
    func answerQuestionAction (answer: String?) {
       
        
        guard questions.count - 1 != currentQuestionNumber else {
            delegate?.questionDidChange(nil, totalScore: totalScore)
            return
        }
        
        let currentQuestion = questions[currentQuestionNumber]
        
        if answer == currentQuestion.correctAnswerText {
            totalScore += currentQuestion.score
        }
        currentQuestionNumber += 1
        delegate?.questionDidChange(questions[currentQuestionNumber],totalScore: totalScore)
    }
    
    func pushHomePage() {
        router.pushHomePage(networkService: networkService)
    }
}
