//
//  AppDelegate.swift
//  myVK
//
//  Created by Дэвид Бердников on 03.01.2022.
//

import UIKit
import VK_ios_sdk

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AuthSeviceDelegate {
    
    var window: UIWindow?

    var authService: AuthService!
    
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        self.authService = AuthService()
        authService.delegate = self
        let authVC: AuthViewController = AuthViewController.loadFromStoryboard()
        
        window?.rootViewController = authVC
        window?.makeKeyAndVisible()
        return true
    }

    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        return true
    }
    
    // MARK: - AuthServiceDelegate
    
    func authServiceShouldShow(_ viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func authServiceSignIn() {
        print(#function)
        let friendsVC: FriendsViewController = FriendsViewController.loadFromStoryboard()
        let navVC = UINavigationController(rootViewController: friendsVC)
        window?.rootViewController = navVC
    }
    
    func authServiceDidSignInFail() {
        print(#function)
    }

}

