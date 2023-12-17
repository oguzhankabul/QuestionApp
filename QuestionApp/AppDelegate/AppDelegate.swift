//
//  AppDelegate.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 15.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        app.route.start()

        return true
    }
}

