//
//  QuestionViewModel.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import Foundation

import Foundation

protocol QuestionPageViewModelDataSource {
    var questions: QuestionList { get }
}

protocol QuestionPageViewModelEventSource { }

protocol QuestionPageViewModelProtocol: QuestionPageViewModelDataSource, QuestionPageViewModelEventSource { }

protocol QuestionPageViewModelDelegate: AnyObject {
    func questionDidChange(_ question: Question)
}

final class QuestionPageViewModel: BaseViewModel<QuestionPageRouter>, QuestionPageViewModelProtocol {
    
    var networkService: NetworkServiceProtocol
    var questions: QuestionList
    var currentQuestionNumber = 0
    
    weak var delegate: QuestionPageViewModelDelegate?

    init(router: QuestionPageRouter, networkService: NetworkServiceProtocol, questions: QuestionList) {
        self.networkService = networkService
        self.questions = questions
        super.init(router: router)
    }
    
    func answerQuestionAction (answer: String) {
        currentQuestionNumber+=1
        if currentQuestionNumber < questions.questions.count {
            delegate?.questionDidChange(questions.questions[currentQuestionNumber])
        }
    }
    
    func pushHomePage() {
        router.pushHomePage(networkService: networkService)
    }
}
