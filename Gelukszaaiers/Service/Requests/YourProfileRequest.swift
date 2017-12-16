//
//  YourProfileRequest.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation
import Alamofire

struct YourProfileRequest {
}

extension YourProfileRequest: Request {

    var path: String {
        return "users/current"
    }

    var method: HTTPMethod {
        return .get
    }

}


