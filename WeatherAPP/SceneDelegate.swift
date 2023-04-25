//
//  SceneDelegate.swift
//  WeatherAPP
//
//  Created by Memory Mhou on 20/04/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // A UIWindow property that will hold the app's main window.
    var window: UIWindow?

    // This method is called when the scene is about to connect to the system.
    // It creates a new UIWindow, assigns a root view controller to it, and makes the window visible.
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        // Ensure that the scene is a UIWindowScene.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create a new UIWindow with the scene and assign it to the window property.
        window = UIWindow(windowScene: windowScene)
        
        // Set the root view controller of the window to a WeatherViewController instance.
        window?.rootViewController = WeatherViewController()
           
        // Make the window key and visible.
        window?.makeKeyAndVisible()
    }
}


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }




