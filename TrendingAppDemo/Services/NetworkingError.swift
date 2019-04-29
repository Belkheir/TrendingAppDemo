//
//  NetworkingError.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation

public enum NetworkingError: Error {
    case invalidURL
    case requestFailed(URL?, Error)
    case invalidResponse
}

extension NetworkingError: CustomNSError {
    public var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL is invalid"
        case .requestFailed:
            return "The request has failed"
        case .invalidResponse:
            return "The response is invalid"

        }
    }
}
