//
//  APIEntpoint.swift
//  QuestionApp
//
//  Created by Oğuzhan Kabul on 16.12.2023.
//

import Foundation

enum APIEndpoint {
    
    case getQuestions
    
    var baseURL: String {
        return "https://demo3633203.mockable.io"
    }
    
    var path: String {
        switch self {
        case .getQuestions:
            return "/hbquiz"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getQuestions:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        switch self {
        case .getQuestions:
            return request
        }
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

