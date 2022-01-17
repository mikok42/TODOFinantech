//
//  SceneDelegate.swift
//  TODOappFinantech
//
//  Created by Mikołaj Linczewski on 15/01/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MainViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

