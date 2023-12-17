//
//  BaseTransition.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 15.12.2023.
//

import UIKit

@objc
protocol BaseTransitionProtocol: AnyObject {
    
    var viewController: UIViewController? { get set }
    
    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}

protocol Animator: UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool { get set }
}
