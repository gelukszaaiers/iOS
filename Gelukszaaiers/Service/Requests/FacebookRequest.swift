//
//  FacebookRequest.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

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

    var query: [String: String] {
        return [
            "token": "facebook_token"
        ]
    }

    var headers: [String: String] {
        return [
            "x-user-agent": "Gelukszaaiers iOS/",
            "Content-Type": "application/json"
        ]
    }

}
