//
//  LoginViewController.swift
//  RxSwiftPractice
//
//  Created by apple on 2020/2/21.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameWarningLabel: UILabel!
    @IBOutlet weak var passwordWarningLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    private var viewModel: LoginValidataionViewModel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = LoginValidataionViewModel(
            username: usernameTextField.rx.text.orEmpty.asObservable(),
            password: passwordTextField.rx.text.orEmpty.asObservable()
        )
        
        viewModel.usernameValid
            .bind(to: usernameWarningLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.passwordValid
            .bind(to: passwordWarningLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.everythingValid
            .bind(to: confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        confirmButton.rx.tap
            .subscribe(onNext: { [weak self] in self?.showAlert() })
            .disposed(by: disposeBag)
        
    }
    
    // hide keyboard when touching anywhere.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "登入成功", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "確認", style: .default, handler: { (action) in
            print("跳轉頁面...")
        }))
        self.present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
