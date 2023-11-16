//
//  RequestFactory.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class RequestFactory {
    
    func request(
        method: HTTPMethod,
        serviceURL: URL,
        queryItems: [URLQueryItem] = [],
        body: Data? = nil,
        authentication: String? = nil
    ) -> URLRequest {
        
        let fullServiceURL = serviceURL.appending(queryItems: queryItems)
        
        var request = URLRequest(url: fullServiceURL)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        if let authentication = authentication {
            request.addValue("Bearer \(authentication)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    
}
