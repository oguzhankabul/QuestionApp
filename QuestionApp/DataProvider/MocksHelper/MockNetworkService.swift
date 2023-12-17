//
//  MockNetworkService.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 17.12.2023.
//

import Foundation

class MockNetworkService: NetworkServiceProtocol {
    func request<T>(endpoint: APIEndpoint) async throws -> T where T : Decodable {
        guard let path = Bundle.main.path(forResource: "MockQuestions", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            throw NetworkError.decodingError(TestError.genericError)
        }
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}

