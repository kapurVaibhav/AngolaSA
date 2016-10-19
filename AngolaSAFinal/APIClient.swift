//
//  APIClient.swift
//  AngolaSAFinal
//
//  Created by Vaibhav Kapur on 18/10/2016.
//  Copyright © 2016 AgeAnalytics. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible{
    static let baseURLString = "http://198.15.126.62:8075/"
    case Read(String)
    var method: Alamofire.HTTPMethod{
        switch self {
        case .Read:
            return .get
        }
    }
    var path: String {
        switch self {
        case .Read(let extendedPath):
                return "\(extendedPath)"
        }
    }
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        switch self {
        default:
            return urlRequest
        }
    }
}


