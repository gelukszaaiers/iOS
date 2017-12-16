//
//  HomeViewModel.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

class HomeViewModel {

    // MARK: - Internals

    private let service: Service

    // MARK: - Handlers

    var updateProfile: (() -> ())?

    // MARK: - Init

    init(service: Service = Service.shared) {
        self.service = service
    }

    // MARK: - Seeds

    private var profile: Profile? {
        didSet {
            updateProfile?()
        }
    }

    // MARK: - Request

    func fetch() {
        let request = YourProfileRequest()
        let serializer = JSONSerializer<Profile>()
        Service.shared.execute(request, with: serializer) {
            switch serializer.response {
            case .success(let result):
                self.profile = result.data
            case .failure(let error):
                print("💥", error)
            }
        }
    }

}
