//
//  UIViewController + Storyboard.swift
//  myVK
//
//  Created by Дэвид Бердников on 05.01.2022.
//

import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error No Initital view controller in \(name) storyboard")
        }
    }
    
}
