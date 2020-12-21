//
//  SceneDelegate.swift
//  transactions
//
//  Created by Stephen Parker on 21/12/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navController = UINavigationController()
        navController.setNavigationBarHidden(true, animated: false)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        window?.makeKey()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
    }
}

