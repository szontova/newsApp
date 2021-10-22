//
//  SignInViewController.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import Lottie
import SGCodeTextField
import UIKit

class LoginViewController: UIViewController {
    
    private var loginView = LoginView()
    private var loginViewModel: LoginViewModel!
    
    private var isCorrect = false
    
    // MARK: - Lifecycle
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel = LoginViewModel()
        loginView.loginButton.addTarget(self, action: #selector(tappedSignInButton), for: .touchUpInside)
        checkCode()
    }
    
    // MARK: - Setup
    private func setupAnimationView() {
        loginView.animationView.loopMode = .playOnce
        loginView.animationView.animationSpeed = 0.9
        loginView.animationView.play { _ in
            UIView.transition(with: self.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
                self.loginView.loadingView.isHidden = true
                self.moveToHome()
            })
        }
    }
    
    // MARK: - Logic
    private func checkCode() {
        if loginViewModel.user.isEmpty {
            loginView.titleLabel.text = "Add your login code"
            loginView.loginButton.setTitle("Add", for: .normal)
        }
    }
    
    private func getDate() -> String {
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.timeZone = calendar.timeZone
        return dateFormatter.string(from:currentDate)
    }

    private func getCode() -> String {
        if loginViewModel.user.isEmpty {
            loginViewModel.addUser(code: loginView.codeTextField.text ?? "", date: getDate(), isLogout: true)
        }
        return loginViewModel.user[0].code
    }
    
    private func moveToHome() {
        if isCorrect {
            loginViewModel.user[0].date = getDate()
            loginViewModel.updateUser(item: loginViewModel.user[0])
            navigationController?.pushViewController(TabBarController(), animated: true)
        } else {
            loginView.errorLabel.isHidden = false
        }
    }
    
    // MARK: - Actions
    @objc private func tappedSignInButton() {
        let code = getCode()
        let inputCode = loginView.codeTextField.text ?? ""
        isCorrect = code == inputCode ? true : false
        UIView.transition(with: view, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.loginView.loadingView.isHidden = false
            self.setupAnimationView()
        })
    }
}
