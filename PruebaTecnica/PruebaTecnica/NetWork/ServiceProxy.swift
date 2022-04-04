//
//  ServiceProxy.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 4/4/22.
//

import Foundation

public enum APIError: Error {
    case system(Error)
    case undefined(String)
    case invalidResponse
    case notFound
    case unableToDecode(String)
    case emptyResponse
}

class ServiceProxy {
    
    private let session: URLSession
    
    init() {
        self.session = .shared
    }
    
    func getItem<T: Decodable>(url: String, type: T.Type, queue: DispatchQueue = .main, completion: @escaping (Result<T, APIError>) -> Void) {
        
        let url = URL(string: url)
        
        var request = URLRequest(url: url!)
        
        request.httpMethod  = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.system(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            switch httpResponse.statusCode {
            case 404:
                completion(.failure(.notFound))
                
            case 200:
                if let data = data {
                    let decoder = JSONDecoder()
                    if let resource = try? decoder.decode(type, from: data) {
                        completion(.success(resource))
                    } else {
                        completion(.failure(.unableToDecode("\(T.self)")))
                    }
                } else {
                    completion(.failure(.emptyResponse))
                }
            default:
                completion(.failure(.undefined("status code: \(httpResponse.statusCode)")))
            }
        }
        
        task.resume()
    }
}
