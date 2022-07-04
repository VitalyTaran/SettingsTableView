//
//  AppDelegate.swift
//  SettingsTableView
//
//  Created by Виталий Таран on 09.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setWindow()
        return true
    }

    func setWindow() {
        let navigationController = UINavigationController(rootViewController: SettingsController())


        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}



