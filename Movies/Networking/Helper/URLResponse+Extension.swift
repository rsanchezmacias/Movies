//
//  URLResponse+Extension.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import Foundation

public extension URLResponse {

    var httpStatusCode: Int? {
        return (self as? HTTPURLResponse)?.statusCode
    }
    
    var isStatusCodeSuccessful: Bool {
        guard let statusCode = self.httpStatusCode else { return false }
        return (200..<300).contains(statusCode)
    }
    
}

