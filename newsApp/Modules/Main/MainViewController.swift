//
//  ViewController.swift
//  newsApp
//
//  Created by User on 12.10.21.
//

import Lottie
import UIKit

class MainViewController: UIViewController {
    private var mainView = MainView()

    // MARK: - Lifecycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimationView()
    }
    
    // MARK: - Setup
    private func setupAnimationView() {
        mainView.animationView.loopMode = .playOnce
        mainView.animationView.animationSpeed = 0.9
        mainView.animationView.play { _ in
            self.moveToLogin()
        }
    }
    
    // MARK: - Logic
    private func moveToLogin() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
