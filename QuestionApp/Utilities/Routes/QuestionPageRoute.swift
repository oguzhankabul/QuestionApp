//
//  QuestionPageRoute.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import Foundation

protocol QuestionPageRoute {
    func pushQuestionPage(networkService: NetworkServiceProtocol, questions: QuestionPresentation)
}

extension QuestionPageRoute where Self: RouterProtocol {
    
    func pushQuestionPage(networkService: NetworkServiceProtocol, questions: QuestionPresentation) {
        let router = QuestionPageRouter()
        let viewModel = QuestionPageViewModel(router: router, networkService: networkService, questionPresentation: questions)
        let viewController = QuestionPageViewController(viewModel: viewModel, nibName: "QuestionPageViewController")
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
