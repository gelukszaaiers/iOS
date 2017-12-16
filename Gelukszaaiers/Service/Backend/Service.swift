//
//  Service.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireActivityLogger

class Service {

    // MARK: - Init

    static let shared = Service()

    private init() {
    }

    // MARK: - Manager

    private lazy var sessionManager: SessionManager = { [unowned self] in
        let manager = SessionManager()
        manager.adapter = Adapter()
        return manager
    }()

    // MARK: - Execute

    func execute(_ request: Request, completion: (() -> Void)? = nil) {
        sessionManager
            .request(request)
            .validate()
            .log(level: .all)
            .responseJSON { response in
            completion?()
        }
    }

}
