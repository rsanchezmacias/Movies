//
//  MovieService.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import Foundation
import Combine

class MovieService {
    
    private let dataTaskFactory: DataTaskFactory
    private let requestFactory: RequestFactory
    
    private var authorization: String?
    
    private let baseURL: URL?
    private let imageBaseURL: URL?
    
    init() {
        dataTaskFactory = DataTaskFactory()
        requestFactory = RequestFactory()
        
        baseURL = URL(string: Constants.Network.serverURL)
        imageBaseURL = URL(string: Constants.Network.serverImageURL)
        
        loadAuthorization()
    }
    
    public func fetchTrendingMovies(_ result: @escaping (Result<[Movie], NetworkError>) -> Void) {
        let urlPath = "\(Constants.Network.serverURL)\(self.trendingServicePath())"
        
        guard let url = URL(string: urlPath) else {
            result(.failure(.urlFormatError))
            return
        }
        
        guard let authorization = authorization else {
            result(.failure(.missingAccessToken))
            return
        }
        
        let languageQueryItem = URLQueryItem(name: "language", value: "en-US")
        
        let request = requestFactory.request(
            method: .get,
            serviceURL: url,
            queryItems: [languageQueryItem],
            authentication: authorization
        )
        
        dataTaskFactory.dataTask(forSession: .shared, request: request, resultType: TrendingMovieResponse.self) { trendingDataResponse, _, _ in
            result(.success(trendingDataResponse.movies))
        } onFail: { _, _, _ in
            result(.failure(.httpError))
        }.resume()
    }
    
    public func fetchTrendingMovies() -> Future<[Movie], NetworkError> {
        return Future() { [weak self] promise in
            guard let self = self else { return }
            
            let urlPath = "\(Constants.Network.serverURL)\(self.trendingServicePath())"
            
            guard let url = URL(string: urlPath) else {
                promise(.failure(.urlFormatError))
                return
            }
            
            guard let authorization = self.authorization else {
                promise(.failure(.missingAccessToken))
                return
            }
            
            let languageQueryItem = URLQueryItem(name: "language", value: "en-US")
            
            let request = self.requestFactory.request(
                method: .get,
                serviceURL: url,
                queryItems: [languageQueryItem],
                authentication: authorization
            )
            
            dataTaskFactory.dataTask(forSession: .shared, request: request, resultType: TrendingMovieResponse.self) { trendingDataResponse, _, _ in
                promise(.success(trendingDataResponse.movies))
            } onFail: { _, _, _ in
                promise(.failure(.httpError))
            }.resume()
        }
    }
    
    private func loadAuthorization() {
        guard let resourcePlistPath = Bundle.main.url(forResource: "TMDBKey", withExtension: "plist") else {
            return
        }
        
        if let resourceDict = try? NSDictionary(contentsOf: resourcePlistPath, error: ()) {
            authorization = resourceDict["accessToken"] as? String
        }
    }
    
}

extension MovieService {
    
    fileprivate func trendingServicePath() -> String {
        return "trending/movie/day"
    }
    
}
