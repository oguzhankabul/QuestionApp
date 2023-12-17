//
//  Array+Extensions.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 17.12.2023.
//

import Foundation

extension Array {
    func safeElement(at index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
