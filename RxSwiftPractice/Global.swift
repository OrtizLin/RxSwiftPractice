//
//  Global.swift
//  RxSwiftPractice
//
//  Created by apple on 2020/2/21.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

func instantiate<T: UIViewController>(storyboard: StoryboardName, viewController: ViewControllerID) -> T {
    let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: viewController.rawValue) as! T
    return viewController
}

enum StoryboardName: String {
    case main = "Main"
    case login = "Login"
}

enum ViewControllerID: String {
    case main = "MainViewController"
    case login = "LoginViewController"
}
