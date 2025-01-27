//
//  APIRoute.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import Foundation

protocol APIRouteBuilder {
    var urlRequest: String { get }
    var baseURL: String { get }
    var path: String { get }
}

enum APIRoute {
    case getNewsList
}

extension APIRoute: APIRouteBuilder {
    var baseURL: String {
        switch self {
        default:
            return "https://newsapi.org/v2"
        }
    }
    
    var path: String {
        switch self {
        case .getNewsList:
            return "/everything?q=bitcoin&apiKey=55a854bd099142709728eb0d39b87358"
        }
    }

    var urlRequest: String {
        switch self {
        default:
            return String(format: "%@%@", baseURL, path)
        }
    }
}
