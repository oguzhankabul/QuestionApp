//
//  BaseNavigationController.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 17.12.2023.
//

import UIKit

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        viewController.navigationItem.hidesBackButton = true
        if viewControllers.count > 1 {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        self.interactivePopGestureRecognizer?.isEnabled = (viewControllers.count > 1)
    }
    
    deinit {
        debugPrint("deinit: \(self)")
    }
}


