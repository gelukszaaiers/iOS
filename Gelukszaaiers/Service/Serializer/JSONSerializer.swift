//
//  JSONSerializer.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import Foundation

class JSONSerializer<T: Codable>: Serializer {

    private var result: Result<T>?
    private var error: BackendError?

    func serialize(_ data: Data?) {
        guard let data = data else {
            self.error = BackendError()
            return
        }

        let decoder = JSONDecoder()
        do {
            self.result = try decoder.decode(Result<T>.self, from: data)
        } catch {
            print(error)
            self.error = BackendError()
        }
    }

    var response: Response<T> {
        if let result = result {
            return .success(result)
        } else if let error = error {
            return .failure(error)
        } else {
            return .failure(BackendError())
        }
    }

}
