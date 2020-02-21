//
//  LoginValidataionViewModel.swift
//  RxSwiftPractice
//
//  Created by apple on 2020/2/21.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginValidataionViewModel {
    
    // 輸出
    let usernameValid: Observable<Bool>
    let passwordValid: Observable<Bool>
    let everythingValid: Observable<Bool>
    
    // 輸入 -> 輸出
    init(
        username: Observable<String>,
        password: Observable<String>
        ) {
        
        usernameValid = username
            .map { $0.count >= 6 }
            .share(replay: 1)
        
        passwordValid = password
            .map { $0.count >= 12 }
            .share(replay: 1)
        
        everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
    }
}
