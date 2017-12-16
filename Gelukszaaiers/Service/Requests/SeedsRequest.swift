//
//  SeedsRequest.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation
import Alamofire

struct SeedsRequest {

    enum Filter: String {
        case proximity
        case latest
        case likes
    }

    private let filter: Filter
    private let offset: Int
    private let limit: Int

    init(filter: Filter, offset: Int = 0, limit: Int = 30) {
        self.filter = filter
        self.offset = offset
        self.limit = limit
    }

}

extension SeedsRequest: Request {

    var path: String {
        return "seeds"
    }

    var method: HTTPMethod {
        return .get
    }

    var query: [String: Any]? {
        return [
            "filter": filter,
            "offset": offset,
            "limit": limit
        ]
    }

}

