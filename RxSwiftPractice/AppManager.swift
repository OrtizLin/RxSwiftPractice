//
//  AppManager.swift
//  RxSwiftPractice
//
//  Created by apple on 2020/2/21.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

protocol Accessible {
    func start()
}

class AppManager: Accessible {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        // 顯示主畫面
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController")
//        self.window.rootViewController = mainVC
        
        // 顯示登入畫面
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.window.rootViewController = loginVC
    }
}
