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
        let loginModel = LoginViewModel()
        let dateDifference = getDateDifference(loginModel.user[0].date.getDate(), getTodayDate().getDate())
        if loginModel.user[0].isLogout && dateDifference < 1 {
            moveToHome()
        } else {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
    
    private func moveToHome() {
        self.navigationController?.pushViewController(TabBarController(), animated: true)
    }
    
    private func getTodayDate() -> String {
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.timeZone = calendar.timeZone
        return dateFormatter.string(from:currentDate)
    }
    
    private func getDateDifference(_ first: Date, _ second: Date) -> Int {
        let calendar = Calendar.current
        let firstDate = calendar.startOfDay(for: first)
        let secondDate = calendar.startOfDay(for: second)
        let components = calendar.dateComponents([.day], from: firstDate, to: secondDate)
        let days = Int(components.day ?? 0)
        return days
    }
    
}
