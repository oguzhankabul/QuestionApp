//
//  NetworkService.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(endpoint: APIEndpoint) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    
    func request<T: Decodable>(endpoint: APIEndpoint) async throws -> T {
        let urlRequest: URLRequest
        do {
            urlRequest = try endpoint.asURLRequest()
        } catch {
            throw NetworkError.requestCreationError(error)
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unkownError
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            break
        default:
            let message = String(data: data, encoding: .utf8)
            throw NetworkError.serverError(statusCode: httpResponse.statusCode, message: message)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
