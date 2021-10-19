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
    private let signInButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01412864786, green: 0, blue: 0.04351914807, alpha: 1)
        signInViewModel = SignInViewModel()
        createTitleLabel()
        createCodeTextField()
        createSignInButton()
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
    
    private func createSignInButton() {
        let randomColor = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.4261274117, blue: 0.4211240271, alpha: 1)].randomElement()
        view.addSubview(signInButton)
        signInButton.backgroundColor = randomColor
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.top.equalTo(view.bounds.height * 0.7)
            maker.height.equalTo(50)
        }
        signInButton.layer.cornerRadius = 20
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Dosis-Regular", size: 24)
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
