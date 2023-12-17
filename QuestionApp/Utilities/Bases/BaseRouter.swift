//
//  BaseRouter.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 15.12.2023.
//

import UIKit

protocol RouterProtocol {
    
    associatedtype V: UIViewController
    var viewController: V? { get }
    
    func open(_ viewController: UIViewController, transition: BaseTransitionProtocol)
}

class Router: RouterProtocol {
    
    weak var viewController: UIViewController?
    var openTransition: BaseTransitionProtocol?
    
    func open(_ viewController: UIViewController, transition: BaseTransitionProtocol) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }
    
    func close(animated: Bool = true, completion: (() -> Void)? = nil) {
        guard let openTransition = openTransition else {
            assertionFailure("You should specify an open transition in order to close a module.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Nothing to close")
            return
        }
        if let openTransition = openTransition as? PushTransition {
            openTransition.isAnimated = animated
            openTransition.completionHandler = completion
        }
        openTransition.close(viewController)
    }
    
    deinit {
        debugPrint("deinit :\(self)")
    }
}
