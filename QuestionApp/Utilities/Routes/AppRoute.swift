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
    
    func start(isFirstStart: Bool = true, networkService: NetworkServiceProtocol = NetworkService()) {
        let router = HomePageRouter()
        let networkService = networkService
        let viewModel = HomePageViewModel(router: router, networkService: networkService)
        let viewController = HomePageController(viewModel: viewModel, nibName: "HomePageViewController")
        let navgationController = UINavigationController(rootViewController: viewController)

        if isFirstStart {
            self.window?.rootViewController = navgationController
            self.window?.makeKeyAndVisible()
        } else {
            UIView.transition(with: self.window!, duration: 0.5, options: .transitionFlipFromRight, animations: {
                self.window?.rootViewController = navgationController
            }, completion: nil)
        }
    }

}

let app = AppContainer()

final class AppContainer {
    let route = AppRoute()
}
