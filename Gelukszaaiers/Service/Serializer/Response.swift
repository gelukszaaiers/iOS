//
//  Response.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

enum Response<T: Codable> {
    case success(Result<T>)
    case failure(BackendError)
}
