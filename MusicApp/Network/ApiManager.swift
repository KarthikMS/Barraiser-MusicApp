//
//  ApiManager.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case somethingWentWrong
}

protocol ApiManaging {
    
    func execute<Response: Decodable>(_ request: Request<Response>, completionHanlder: @escaping (Result<Response, APIError>) -> Void)
    
}


final class ApiManager: ApiManaging {
    
    private let baseURL = "https://www.learningcontainer.com/wp-content/"
    
    func execute<Response: Decodable>(_ request: Request<Response>, completionHanlder: @escaping (Result<Response, APIError>) -> Void) {
        guard let urlRequest = urlRequest(for: request) else {
            completionHanlder(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data,
                  (response as? HTTPURLResponse)?.statusCode == 200,
                  error == nil else {
                completionHanlder(.failure(.somethingWentWrong))
                return
            }
            
            guard let responseObject = try? JSONDecoder().decode(Response.self, from: data) else {
                completionHanlder(.failure(.invalidResponse))
                return
            }
            
            completionHanlder(.success(responseObject))
        }.resume()
    }
    
    private func urlRequest<Response>(for request: Request<Response>) -> URLRequest? {
        let urlString = baseURL + request.endPoint
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)
    }
    
}
