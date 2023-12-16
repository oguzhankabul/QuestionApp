//
//  AppRoute.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import UIKit

final class AppRoute {
    
    var window: UIWindow?
    
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let router = HomePageRouter()
        let networkService = NetworkService()
        let viewModel = HomePageViewModel(router: router, networkService: networkService)
        let viewController = HomePageController(viewModel: viewModel, nibName: "HomePageViewController")
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }
}

let app = AppContainer()

final class AppContainer {
    let route = AppRoute()
}
