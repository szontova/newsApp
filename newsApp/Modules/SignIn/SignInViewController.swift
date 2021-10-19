//
//  SignInViewController.swift
//  newsApp
//
//  Created by User on 19.10.21.
//

import Lottie
import SGCodeTextField
import UIKit

class SignInViewController: UIViewController {
    
    private var signInViewModel: SignInViewModel!
    private let titleLabel = UILabel()
    private let errorLabel = UILabel()
    private let codeTextField = SGCodeTextField()
    private let signInButton = UIButton(type: .system)
    private let loadingView = UIView()
    private let animationView = AnimationView()
    
    private var isCorrect = false
    private let colors = [UIColor.lime, .carrot, .richYellow, .rosy]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkness
        signInViewModel = SignInViewModel()
        createTitleLabel()
        createCodeTextField()
        createSignInButton()
    }
    
    private func createTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Enter your login code"
        titleLabel.textColor = .freeze
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(view.bounds.height * 0.2)
        }
    }
    
    private func createErrorLabel() {
        view.addSubview(errorLabel)
        errorLabel.text = "Incorrect code"
        errorLabel.textColor = .rosy
        errorLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        errorLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(codeTextField).inset(view.bounds.height * 0.07)
        }
    }
    
    private func createCodeTextField() {
        view.addSubview(codeTextField)
        codeTextField.textColor = .freeze
        codeTextField.digitBackgroundColorEmpty = .clear
        codeTextField.digitBackgroundColor = .clear
        codeTextField.digitBorderColorFocused = colors.randomElement()!
        codeTextField.placeholder = ""
        codeTextField.digitBorderColor = .freeze
        codeTextField.digitBackgroundColorFocused = .clear
        codeTextField.digitSpacing = 20
        codeTextField.textColorFocused = .freeze
        codeTextField.keyboardType = .numberPad
        codeTextField.count = 6
        codeTextField.font = UIFont(name: "Dosis-Regular", size: 20)!
        
        codeTextField.textChangeHandler = { text, _ in
            self.codeTextField.digitBorderColorFocused = self.colors.randomElement()!
            if text?.count == 6 {
                self.signInButton.isUserInteractionEnabled = true
                self.signInButton.alpha = 1.0
            } else {
                self.signInButton.isUserInteractionEnabled = false
                self.signInButton.alpha = 0.5
            }
        }
        
        codeTextField.snp.makeConstraints { maker in
            maker.width.equalTo(view.bounds.width * 0.9)
            maker.height.equalTo(view.bounds.width * 0.15)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(titleLabel).inset(view.bounds.width * 0.2)
        }
    }
    
    private func createSignInButton() {
        view.addSubview(signInButton)
        signInButton.backgroundColor = colors.randomElement()
        signInButton.setTitle("Sign In", for: .normal)
        if signInViewModel.user.isEmpty {
            titleLabel.text = "Add your login code"
            signInButton.setTitle("Add", for: .normal)
        }
        signInButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.top.equalTo(view.bounds.height * 0.7)
            maker.height.equalTo(50)
        }
        signInButton.layer.cornerRadius = 20
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Dosis-Regular", size: 24)
        signInButton.isUserInteractionEnabled = false
        signInButton.alpha = 0.5
        
        signInButton.addTarget(self, action: #selector(tappedSignInButton), for: .touchUpInside)
    }
    
    private func createLoadingView() {
        view.addSubview(loadingView)
        loadingView.backgroundColor = #colorLiteral(red: 0.01412864786, green: 0, blue: 0.04351914807, alpha: 0.6966977085)
        loadingView.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.height.equalToSuperview()
        }
        createAnimationView()
    }
    
    private func createAnimationView() {
        loadingView.addSubview(animationView)
        animationView.animation = Animation.named("loading")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 0.9
        animationView.play { _ in
            UIView.transition(with: self.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
                self.loadingView.removeFromSuperview()
                if self.isCorrect {
                    self.performSegue(withIdentifier: "toHomeSegue", sender: nil)
                } else {
                    self.createErrorLabel()
                }
            })
        }
        
        animationView.snp.makeConstraints { maker in
            maker.height.equalTo(view.bounds.height * 0.5)
            maker.width.equalTo(view.bounds.height * 0.5)
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
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
            signInViewModel.addUser(code: codeTextField.text ?? "", date: getDate())
        }
        return signInViewModel.user[0].code
    }
    
    // MARK: - Actions
    @objc private func tappedSignInButton() {
        let code = getCode()
        let inputCode = codeTextField.text ?? ""
        isCorrect = code == inputCode ? true : false
        UIView.transition(with: view, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.createLoadingView()
        })
    }
}
