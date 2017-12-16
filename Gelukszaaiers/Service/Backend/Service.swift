//
//  Service.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

protocol Request {

}

class Service {

    // MARK: - Init

    static let shared = Service()

    private init() {
    }

    // MARK: - Execute

    func execute(_ request: Request, completion: (() -> Void)? = nil) {
        completion?()
    }

}
