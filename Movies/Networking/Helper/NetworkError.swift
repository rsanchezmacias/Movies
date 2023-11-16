//
//  NetworkError.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/16/23.
//

import Foundation

enum NetworkError: Error {
    case httpError
    case urlFormatError
    case missingAccessToken
}
