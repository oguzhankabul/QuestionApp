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
    
    var networkService: NetworkServiceProtocol
    
    init(router: HomePageRouter, networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        super.init(router: router)
        Task {
            do {
                let a: QuestionList = try await networkService.request(endpoint: .getQuestions)
                print(a)
            } catch {
                print("Couldn't Question Response")
            }
        }

    }
}
