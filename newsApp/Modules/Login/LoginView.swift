//
//  LoginView.swift
//  newsApp
//
//  Created by User on 22.10.21.
//

import Lottie
import SGCodeTextField
import UIKit

class LoginView: UIView {
    let titleLabel = UILabel()
    let errorLabel = UILabel()
    let codeTextField = SGCodeTextField()
    let signInButton = UIButton(type: .system)
    let loadingView = UIView()
    let animationView = AnimationView()
    
    private let colors = [UIColor.lime, .carrot, .richYellow, .rosy]
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func configureUI() {
        backgroundColor = .darkness
        createTitleLabel()
        createCodeTextField()
        createErrorLabel()
        createSignInButton()
        createLoadingView()
    }
    
    private func createTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Enter your login code"
        titleLabel.textColor = .freeze
        titleLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(UIScreen.main.bounds.height * 0.2)
        }
    }
    
    private func createErrorLabel() {
        addSubview(errorLabel)
        errorLabel.text = "Incorrect code"
        errorLabel.textColor = .rosy
        errorLabel.font = UIFont(name: "Dosis-Regular", size: 24)
        errorLabel.isHidden = true
        errorLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(codeTextField).inset(UIScreen.main.bounds.height * 0.1)
        }
    }
    
    private func createCodeTextField() {
        addSubview(codeTextField)
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
            maker.width.equalTo(UIScreen.main.bounds.width * 0.9)
            maker.height.equalTo(UIScreen.main.bounds.width * 0.15)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(titleLabel).inset(UIScreen.main.bounds.width * 0.2)
        }
    }
    
    private func createSignInButton() {
        addSubview(signInButton)
        signInButton.backgroundColor = colors.randomElement()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
            maker.top.equalTo(UIScreen.main.bounds.height * 0.7)
            maker.height.equalTo(50)
        }
        signInButton.layer.cornerRadius = 20
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Dosis-Regular", size: 24)
        signInButton.isUserInteractionEnabled = false
        signInButton.alpha = 0.5
    }
    
    private func createLoadingView() {
        addSubview(loadingView)
        loadingView.backgroundColor = #colorLiteral(red: 0.01412864786, green: 0, blue: 0.04351914807, alpha: 0.6966977085)
        loadingView.isHidden = true
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
        
        animationView.snp.makeConstraints { maker in
            maker.height.equalTo(UIScreen.main.bounds.height * 0.5)
            maker.width.equalTo(UIScreen.main.bounds.height * 0.5)
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
    }
}
