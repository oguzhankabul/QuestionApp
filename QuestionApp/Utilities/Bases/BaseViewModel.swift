//
//  BaseViewModel.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 15.12.2023.
//

import UIKit

protocol BaseViewModelProtocol {
    func viewDidLoad()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R
    
    init(router: R) {
        self.router = router
    }
    
    func viewDidLoad() { }
    
    deinit {
        debugPrint("deinit \(self)")
    }
}
