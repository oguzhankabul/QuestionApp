//
//  UserDefaults+Extensions.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 17.12.2023.
//

import Foundation

extension UserDefaults {
    
    private enum Keys {
        static let highestScore = "highestScore"
    }
    
    static func saveHighestScore(_ score: Int) {
        let currentHighest = UserDefaults.standard.integer(forKey: Keys.highestScore)
        if score > currentHighest {
            UserDefaults.standard.set(score, forKey: Keys.highestScore)
        }
    }
    
    static func getHighestScore() -> Int {
        return UserDefaults.standard.integer(forKey: Keys.highestScore)
    }
}
