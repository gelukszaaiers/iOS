//
//  AppDelegate.swift
//  Gelukszaaiers
//
//  Created by Jelle Vandebeeck on 16/12/2017.
//  Copyright © 2017 Gelukszaaiers. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // FACEBOOK EXAMPLE
//        let request = FacebookRequest(token: "facebook_token")
//        let serializer = JSONSerializer<Profile>()
//        Service.shared.execute(request, with: serializer) {
//            switch serializer.response {
//            case .success(let result):
//                print(result.data)
//            case .failure(let error):
//                print(error)
//            }
//        }

        // SEEDS EXAMPLE
//        let request = SeedsRequest(filter: .likes)
//        let serializer = JSONSerializer<[Seed]>()
//        Service.shared.execute(request, with: serializer) {
//            switch serializer.response {
//            case .success(let result):
//                print(result.data)
//            case .failure(let error):
//                print(error)
//            }
//        }        
        
        return true
    }

}

