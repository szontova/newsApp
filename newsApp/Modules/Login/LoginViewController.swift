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
    private var signInViewModel: LoginViewModel!
    
    private var isCorrect = false
    
    // MARK: - Lifecycle
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInViewModel = LoginViewModel()
        loginView.signInButton.addTarget(self, action: #selector(tappedSignInButton), for: .touchUpInside)
        checkCode()
    }
    
    // MARK: - Setup
    private func setupAnimationView() {
        loginView.animationView.loopMode = .playOnce
        loginView.animationView.animationSpeed = 0.9
        loginView.animationView.play { _ in
            UIView.transition(with: self.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
                self.loginView.loadingView.isHidden = true
                if self.isCorrect {
                    self.navigationController?.pushViewController(NewsViewController(), animated: true)
                } else {
                    self.loginView.errorLabel.isHidden = false
                }
            })
        }
    }
    
    // MARK: - Logic
    private func checkCode() {
        if signInViewModel.user.isEmpty {
            loginView.titleLabel.text = "Add your login code"
            loginView.signInButton.setTitle("Add", for: .normal)
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
        if signInViewModel.user.isEmpty {
            signInViewModel.addUser(code: loginView.codeTextField.text ?? "", date: getDate(), isLogout: true)
        }
        return signInViewModel.user[0].code
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
