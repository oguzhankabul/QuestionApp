//
//  ViewModel.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import Foundation

protocol HomePageViewModelDataSource {
    
}

protocol HomePageViewModelEventSource {
    
}

protocol HomePageViewModelProtocol: HomePageViewModelDataSource, HomePageViewModelEventSource { }


final class HomePageViewModel: BaseViewModel<HomePageRouter>, HomePageViewModelProtocol {
    
    private var networkService: NetworkServiceProtocol
    private var questions: QuestionList? = nil
    
    init(router: HomePageRouter, networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        super.init(router: router)
    }
    
    func getQuizList() {
        Task {
            do {
                questions = try await networkService.request(endpoint: .getQuestions)
                guard let questions = questions else { return }
                DispatchQueue.main.async {
                       self.pushQuestionPage(questions: questions)
                   }
            } catch {
                print("Couldn't Question Response")
            }
        }
    }
    
    private func pushQuestionPage(questions: QuestionList) {
        router.pushQuestionPage(networkService: networkService, questions: questions)

    }
}
