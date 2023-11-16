//
//  DataRequestFactory.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import Foundation

class DataTaskFactory {
    
    private let decoder = JSONDecoder()
    
    func dataTask<T>(
        forSession urlSession: URLSession,
        request: URLRequest,
        resultType: T.Type,
        onSucceed: @escaping (T, URLResponse?, Data?) -> Void,
        onFail: @escaping (Error?, URLResponse?, Data?) -> Void
    ) -> URLSessionDataTask where T: Decodable {
        return urlSession.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if response?.isStatusCodeSuccessful == false {
                onFail(error, response, data)
                return
            }
            
            if let data = data {
                do {
                    let result = try self.decoder.decode(resultType, from: data)
                    onSucceed(result, response, data)
                } catch {
                    onFail(error, response, data)
                }
            } else {
                onFail(error, response, data)
            }
        }
    }
    
}
