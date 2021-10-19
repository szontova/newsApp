//
//  SignInViewController.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import UIKit

class SignInViewController: UIViewController {
    private var signInViewModel: SignInViewModel!
    private let titleLabel = UILabel()
    private let codeTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01412864786, green: 0, blue: 0.04351914807, alpha: 1)
        signInViewModel = SignInViewModel()
        createTitleLabel()
        createCodeTextField()
    }
    
    private func createTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Enter your login code"
        titleLabel.textColor = #colorLiteral(red: 0.9339585077, green: 0.9601209991, blue: 1, alpha: 1)
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(view.bounds.height * 0.2)
        }
    }
    
    private func createCodeTextField() {
        view.addSubview(codeTextField)
        codeTextField.snp.makeConstraints { maker in
            maker.width.equalTo(view.bounds.width * 0.8)
            maker.height.equalTo(view.bounds.width * 0.1)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(titleLabel).inset(view.bounds.width * 0.2)
        }
        codeTextField.textColor = #colorLiteral(red: 0.9339585077, green: 0.9601209991, blue: 1, alpha: 1)
        codeTextField.backgroundColor = .clear
        codeTextField.layer.borderWidth = 1
        codeTextField.layer.borderColor = #colorLiteral(red: 0.9339585077, green: 0.9601209991, blue: 1, alpha: 1)
        codeTextField.font = UIFont(name: "Dosis-Regular", size: 20)
    }
    
    private func getDate() -> String {
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.timeZone = calendar.timeZone
        return dateFormatter.string(from:currentDate)
    }
}
