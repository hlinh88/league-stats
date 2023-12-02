//
//  AppDelegate.swift
//  LeagueStats
//
//  Created by Hoang Linh Nguyen on 23/11/2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        var keys: NSDictionary?

        if let path = Bundle.main.path(forResource: "Key", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let dict = keys {
            let api_key = dict["API_KEY"] as? String

            Constants.api_key = api_key ?? ""
        }
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

