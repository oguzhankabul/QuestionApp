//
//  PushTransition.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import UIKit

class PushTransition: NSObject {
    
    var animator: Animator?
    var isAnimated: Bool = true
    var completionHandler: (() -> Void)?
    weak var viewController: UIViewController?

    
    init(animator: Animator? = nil, isAnimated: Bool = true) {
        self.animator = animator
        self.isAnimated = isAnimated
    }
}

extension PushTransition: BaseTransitionProtocol {
    
    func open(_ viewController: UIViewController) {
        
        let navigationController = app.route.window!.rootViewController as! UINavigationController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func close(_ viewController: UIViewController) {
        let navigationController = app.route.window!.rootViewController as! UINavigationController
        navigationController.popViewController(animated: isAnimated)
    }
}

extension PushTransition: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        completionHandler?()
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else {
            return nil
        }
        if operation == .push {
            animator.isPresenting = true
            return animator
        } else {
            animator.isPresenting = false
            return animator
        }
    }
}
