//
//  Request.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation
import Alamofire

protocol Request: URLRequestConvertible {
    var path: String { get }
    var method: HTTPMethod { get }

    var query: [String: Any]? { get }
    var body: [String: Any]? { get }
}

/// URLRequestConvertible

extension Request {

    private var baseURL: URL {
        return URL(string: "https://private-anon-5e817a5195-gelukszaaiers.apiary-mock.com")!
    }

    private func httpBody() throws -> Data? {
        guard let body = body else { return nil }
        return try JSONSerialization.data(withJSONObject: body, options: [])
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = try URLRequest(url: url, method: method)
        urlRequest.httpBody = try httpBody()
        return try URLEncoding.queryString.encode(urlRequest, with: query)
    }

}

/// DEFAULT IMPLEMTATIONS

extension Request {
    var query: [String: Any]? {
        return nil
    }

    var body: [String: Any]? {
        return nil
    }
}
