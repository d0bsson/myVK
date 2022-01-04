//
//  AuthViewController.swift
//  myVK
//
//  Created by Дэвид Бердников on 03.01.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        authService = AppDelegate.shared().authService
    }

    @IBAction func signTouch() {
        authService.wakeUpSession()
    }
}
