//
//  FacebookRequest.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation
import Alamofire

struct FacebookRequest {

    private let token: String

    init(token: String) {
        self.token = token
    }

}

extension FacebookRequest: Request {

    var path: String {
        return "auth/facebook"
    }

    var method: HTTPMethod {
        return .get
    }

    var query: [String: Any]? {
        return [
            "token": token
        ]
    }

}
