//
//  HomePageRoute.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import UIKit

protocol HomePageRoute {
    func pushHomePage(networkService: NetworkServiceProtocol)
}

extension HomePageRoute where Self: RouterProtocol {
    
    func pushHomePage(networkService: NetworkServiceProtocol) {
        app.route.start(isFirstStart: false, networkService: networkService)
    }
}
