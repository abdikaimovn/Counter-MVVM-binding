//
//  SceneDelegate.swift
//  Counter+MVVM+binding
//
//  Created by Нурдаулет on 27.03.2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setupWindow(scene: scene)
    }

    private func setupWindow(scene: UIScene) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: buildMainModule())
        
        window.makeKeyAndVisible()
        self.window = window
    }
   
    private func buildMainModule() -> UIViewController {
        let viewModel = MainViewModel()
        let view = MainViewController(viewModel: viewModel)
        
        return view
    }
}

