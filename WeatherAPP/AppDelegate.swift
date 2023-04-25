//
//  AppDelegate.swift
//  WeatherAPP
//
//  Created by Memory Mhou on 20/04/2023.
//

import UIKit

@main
// The @main attribute is used to designate the AppDelegate class as the entry point
// for the app. This is required for iOS app development.

class AppDelegate: UIResponder, UIApplicationDelegate {
    // This variable represents the app's window, which acts as the main container
       // for all the app's content.
    var window: UIWindow?
    
    
    // This method is called when the app finishes launching. It is typically used
    // to perform any necessary setup or configuration tasks.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        // Here, we are simply returning a Boolean value of true to indicate that the
        // app launched successfully.
        return true
    }
}


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }




